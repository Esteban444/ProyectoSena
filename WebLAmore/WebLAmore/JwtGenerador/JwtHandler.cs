using Google.Apis.Auth;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using WebLAmore.Core.Modelos;
using WebLAmore.Core.DTO.Request;

namespace WebLAmore.JwtGenerador
{
    public class JwtHandler
    {
		private readonly IConfiguration _configuracion;
		private readonly IConfigurationSection _jwtConfiguracion;
		private readonly IConfigurationSection _goolgeSettings;
		private readonly UserManager<Usuario> _userManager;
		public JwtHandler(IConfiguration configuracion, UserManager<Usuario> userManager)
		{
			_userManager = userManager;
			_configuracion = configuracion;
			_jwtConfiguracion = _configuracion.GetSection("JWTConfiguracion");
			_goolgeSettings = _configuracion.GetSection("GoogleAuthConfiguracion");
		}

		private SigningCredentials ObtenerFirmaCredenciales()
		{
			var key = Encoding.UTF8.GetBytes(_jwtConfiguracion.GetSection("securityKey").Value);
			var secret = new SymmetricSecurityKey(key);

			return new SigningCredentials(secret, SecurityAlgorithms.HmacSha256);
		}

		private async Task<List<Claim>> ObtenerClaims(Usuario usuario)
		{
			var claims = new List<Claim>
			{
				new Claim(ClaimTypes.Name, usuario.Email)
			};

			var roles = await _userManager.GetRolesAsync(usuario);
			foreach (var role in roles)
			{
				claims.Add(new Claim(ClaimTypes.Role, role));
			}

			return claims;
		}

		private JwtSecurityToken GenerarTokenOptions(SigningCredentials signingCredentials, List<Claim> claims)
		{
			var tokenOptions = new JwtSecurityToken(
				issuer: _jwtConfiguracion.GetSection("validIssuer").Value,
				audience: _jwtConfiguracion.GetSection("validAudience").Value,
				claims: claims,
				expires: DateTime.Now.AddMinutes(Convert.ToDouble(_jwtConfiguracion.GetSection("expiryInMinutes").Value)),
				signingCredentials: signingCredentials);

			return tokenOptions;
		}

		public async Task<string> GenerarToken(Usuario user)
		{
			var firmacredenciales = ObtenerFirmaCredenciales();
			var claims = await ObtenerClaims(user);
			var opcionestoken = GenerarTokenOptions(firmacredenciales, claims);
			var token = new JwtSecurityTokenHandler().WriteToken(opcionestoken);

			return token;
		}

		public async Task<GoogleJsonWebSignature.Payload> VerificacionGoogleToken(AutenticacionExternaDto autentificacionExt)
		{
			try
			{
				var configuracion = new GoogleJsonWebSignature.ValidationSettings()
				{
					Audience = new List<string>() { _goolgeSettings.GetSection("clientId").Value }
				};

				var payload = await GoogleJsonWebSignature.ValidateAsync(autentificacionExt.IdToken, configuracion);
				return payload;
			}
			catch (Exception ex)
			{
				//log an exception
				return null;
			}
		}
	}
}
