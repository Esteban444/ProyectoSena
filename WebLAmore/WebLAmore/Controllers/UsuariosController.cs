using AutoMapper;
using FluentValidation;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.WebUtilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using WebLAmore.core.Interfaces;
using WebLAmore.Core.Modelos;
using WebLAmore.Core.DTO.Request;
using WebLAmore.Core.DTO.Response;
using WebLAmore.Infraestructura.ServicioEmail;
using WebLAmore.JwtGenerador;

namespace WebLAmore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosController : ControllerBase
    {
		private readonly IRepositorioBase<Usuario> _baseRepositorio;  
		private readonly UserManager<Usuario> _userManager;
		private readonly IMapper _mapper;
		private readonly JwtHandler _jwtHandler;
		private readonly IEmailSender _emailSender;
		private readonly IValidator<AutenticacionUsuarioDto> _validatorAuten;
		private readonly IValidator<VerificacionEnDosPasosDto> _validatorVerif;

		public UsuariosController(IRepositorioBase<Usuario> repositorioBase, UserManager<Usuario> userManager, IMapper mapper, JwtHandler
			jwtHandler, IEmailSender emailSender, IValidator<AutenticacionUsuarioDto> validatoraut,
			IValidator<VerificacionEnDosPasosDto> validatorVerif)
		{
			_baseRepositorio = repositorioBase;
			_userManager = userManager;
			_mapper = mapper;
			_jwtHandler = jwtHandler;
			_emailSender = emailSender;
			_validatorAuten = validatoraut;
			_validatorVerif = validatorVerif;
		}

		[HttpPost("registrarse")]
		public async Task<IActionResult> RegistrarUsuario([FromBody] RegistroUsuarioDto registroUsuario)
		{
			if (registroUsuario == null || !ModelState.IsValid)
				return BadRequest();
			var emaildb = _baseRepositorio.GetSingle(x => x.Email == registroUsuario.Email);
			if (emaildb != null)
			{
				return BadRequest("Con este email ya hay otro usurio registrado.");
			}
			var usuariodb = _baseRepositorio.GetSingle(x => x.UserName == registroUsuario.UserName);
			if (usuariodb != null)
			{
				return BadRequest("Otro usurio ya utiliza este nombre de usurio.");
			}

			registroUsuario.Discriminador = "Usuario";
			var user = _mapper.Map<Usuario>(registroUsuario);

			var result = await _userManager.CreateAsync(user, registroUsuario.Password);
			if (!result.Succeeded)
			{
				var errors = result.Errors.Select(e => e.Description);

				return BadRequest(new RespuestaRegistroDto { Errors = errors });
			}

			var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
			var param = new Dictionary<string, string>
			{
				{"token", token },
				{"email", user.Email }
			};

			var callback = QueryHelpers.AddQueryString(registroUsuario.ClientURI, param);
			await _userManager.AddToRoleAsync(user, "Admin");

			return StatusCode(201);
		}

		[HttpPost("inicioseccion")]
		public async Task<IActionResult> InicioSeccion([FromBody] AutenticacionUsuarioDto autentificacionUsuario)
		{
			var Validacion = _validatorAuten.Validate(autentificacionUsuario);
			if (!Validacion.IsValid)
			{
				var errors = Validacion.Errors.Select(e => e.ErrorMessage);

				return BadRequest(new RespuestaInicioSeccionDto { Errors = errors });
			}

			var usuario = await _userManager.FindByEmailAsync(autentificacionUsuario.Email);
			if (usuario == null)
				return BadRequest("El usuario no existe.");

			//if (!await _userManager.IsEmailConfirmedAsync(usuario))
			//return Unauthorized(new AuthRespuestaDTO { MensajeError = "Email no confirmado." });

			if (!await _userManager.CheckPasswordAsync(usuario, autentificacionUsuario.Password))
			{
				await _userManager.AccessFailedAsync(usuario);

				if (await _userManager.IsLockedOutAsync(usuario))
				{
					var contenido = $"Su cuenta esta bloqueada. Pararestablecer su contraseña has clic en este enlace: {autentificacionUsuario.ClientURI}";
					var message = new Mensaje(new string[] { autentificacionUsuario.Email }, "Informacion de cuenta bloqueada.", contenido, null);
					await _emailSender.SendEmailAsync(message);

					return Unauthorized(new AuthRespuestaDto { MensajeError = "La cuenta esta bloqueada." });
				}

				return Unauthorized(new AuthRespuestaDto { MensajeError = "Autentificacion invalida" });
			}

			if (await _userManager.GetTwoFactorEnabledAsync(usuario))
				return await GenerarOTPDeVerificacionEnDosPasos(usuario);

			var token = await _jwtHandler.GenerarToken(usuario);

			await _userManager.ResetAccessFailedCountAsync(usuario);

			return Ok(new AuthRespuestaDto { AuthExitosa = true, Token = token });
		}

		private async Task<IActionResult> GenerarOTPDeVerificacionEnDosPasos(Usuario usuario)
		{
			var proveedor = await _userManager.GetValidTwoFactorProvidersAsync(usuario);
			if (!proveedor.Contains("Email"))
			{
				return Unauthorized(new AuthRespuestaDto { MensajeError = "Verificacion de proveedor en dos pasos no valida." });
			}

			var token = await _userManager.GenerateTwoFactorTokenAsync(usuario, "Email");
			var mensaje = new Mensaje(new string[] { usuario.Email }, "Authentication token", token, null);
			await _emailSender.SendEmailAsync(mensaje);

			return Ok(new AuthRespuestaDto { Verificacion = true, Proveedor = "Email" });
		}

		[HttpPost("VerificacionEnDosPasos")]
		public async Task<IActionResult> VerificacionDosPasos([FromBody] VerificacionEnDosPasosDto verificacionDosPasosDTO)
		{
			var Validacion = _validatorVerif.Validate(verificacionDosPasosDTO);
			if (!Validacion.IsValid)
			{
				var errors = Validacion.Errors.Select(e => e.ErrorMessage);

				return BadRequest(new RespuestaVerifEnDosPasosDto { Errors = errors });
			}

			var usuario = await _userManager.FindByEmailAsync(verificacionDosPasosDTO.Email);
			if (usuario == null)
				return BadRequest("El usurio invalido");

			var Verificacion = await _userManager.VerifyTwoFactorTokenAsync(usuario, verificacionDosPasosDTO.Provider, verificacionDosPasosDTO.Token);
			if (!Verificacion)
				return BadRequest("verificacion token invalido");

			var token = await _jwtHandler.GenerarToken(usuario);
			return Ok(new AuthRespuestaDto { AuthExitosa = true, Token = token });
		}

		[HttpPost("OlvidoContraseña")]
		public async Task<IActionResult> OlvidoContraceña([FromBody] OlvidoContraseñaDto olvidoContraseña)
		{
			if (!ModelState.IsValid)
				return BadRequest();

			var usuario = await _userManager.FindByEmailAsync(olvidoContraseña.Email);
			if (usuario == null)
				return BadRequest("Usuario Invalido.");

			var token = await _userManager.GeneratePasswordResetTokenAsync(usuario);
			var param = new Dictionary<string, string>
			{
				{"token", token },
				{"email", olvidoContraseña.Email }
			};

			var callback = QueryHelpers.AddQueryString(olvidoContraseña.ClientURI, param);

			//var message = new Message(new string[] { "codemazetest@gmail.com" }, "Reset password token", callback, null);
			//await _emailSender.SendEmailAsync(message);

			return Ok();
		}

		[HttpPost("RestablecerContraseña")]
		public async Task<IActionResult> ResetPassword([FromBody] RestablecerContraseñaDto restablecerContraseña)
		{
			if (!ModelState.IsValid)
				return BadRequest();

			var usuario = await _userManager.FindByEmailAsync(restablecerContraseña.Email);
			if (usuario == null)
				return BadRequest("Usuario invalido.");

			var resetPassResult = await _userManager.ResetPasswordAsync(usuario, restablecerContraseña.Token, restablecerContraseña.Contrasena);
			if (!resetPassResult.Succeeded)
			{
				var errors = resetPassResult.Errors.Select(e => e.Description);

				return BadRequest(new { Errors = errors });
			}

			await _userManager.SetLockoutEndDateAsync(usuario, new DateTime(2000, 1, 1));

			return Ok();
		}

		[HttpGet("EmailConfirmacion")]
		public async Task<IActionResult> EmailConfirmation([FromQuery] string email, [FromQuery] string token)
		{
			var usuario = await _userManager.FindByEmailAsync(email);
			if (usuario == null)
				return BadRequest("Email de usuario invalido");

			var confirmResult = await _userManager.ConfirmEmailAsync(usuario, token);
			if (!confirmResult.Succeeded)
				return BadRequest("Solicitud de confirmación por correo electrónico no válida.");

			return Ok();
		}

		[HttpPost("InicioSeccionExterna")]
		public async Task<IActionResult> ExternalLogin([FromBody] AutenticacionExternaDto externaDTO)
		{
			var payload = await _jwtHandler.VerificacionGoogleToken(externaDTO);
			if (payload == null)
				return BadRequest("Autenticacion invalida.");

			var info = new UserLoginInfo(externaDTO.Proveedor, payload.Subject, externaDTO.Proveedor);

			var user = await _userManager.FindByLoginAsync(info.LoginProvider, info.ProviderKey);
			if (user == null)
			{
				user = await _userManager.FindByEmailAsync(payload.Email);

				if (user == null)
				{
					var json = JsonSerializer.Serialize(payload);

					user = new Usuario { Email = payload.Email, UserName = payload.Email, Nombres = externaDTO.Nombres, Discriminador = "Usuario", JoinDate = DateTime.Now };
					if (externaDTO.Proveedor == "GOOGLE")
					{
						user.Google = json;
					}

					await _userManager.CreateAsync(user);

					//prepare and send an email for the email confirmation

					await _userManager.AddToRoleAsync(user, "USER");
					await _userManager.AddLoginAsync(user, info);
				}
				else
				{
					await _userManager.AddLoginAsync(user, info);
				}
			}

			if (user == null)
				return BadRequest("Autenticacion externa invalida.");

			//check for the Locked out account

			var token = await _jwtHandler.GenerarToken(user);
			return Ok(new AuthRespuestaDto { Token = token, AuthExitosa = true });
		}
	}
}
