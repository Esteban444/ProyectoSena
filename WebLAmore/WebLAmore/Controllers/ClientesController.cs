using AutoMapper;
using FluentValidation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using WebLAmore.Core.DTO.Request;
using WebLAmore.Core.DTO.Response;
using WebLAmore.Core.Excepciones;
using WebLAmore.Core.FiltrosBusqueda;
using WebLAmore.Core.Interfaces;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    ////[Authorize]
    public class ClientesController : ControllerBase
    {
        private readonly IRepositorioClientes _repositorio;
        private readonly IMapper _mapper;
        private readonly IValidator<ClienteBase> _validator;

        public ClientesController(IRepositorioClientes repositorio, IMapper mapper,IValidator<ClienteBase> validator)
        {
            _repositorio = repositorio;
            _mapper = mapper; 
            _validator = validator;
        }
         
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ClienteDto>>> ConsultarClientes([FromQuery] BusquedaClientes filtro)
        {
            var clientes = await _repositorio.ConsultarClientes(filtro);
            var clientesDto = _mapper.Map<IEnumerable<ClienteDto>>(clientes);
            return Ok(clientesDto);
        }

        [HttpGet("{id}")]
        public ActionResult<ClienteDto> ConsultaPorId(int id)
        {
            var clientebd =   _repositorio.ConsultaPorId(x => x.IdClientes == id);
            if(clientebd != null)
            {
                var clienteDto = _mapper.Map<ClienteDto>(clientebd);
                return Ok(clienteDto);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El cliente no existe en la base de datos" });
            }
        }

        [HttpPost]
        public async Task<ActionResult> CrearCliente(ClienteBase clientebase)
        {
            var validacion = _validator.Validate(clientebase);
            if (!validacion.IsValid)
            {
                var errors = validacion.Errors.Select(x => x.ErrorMessage);
                return BadRequest( new RespuestaClienteDto {Errors = errors});
            }
            var cliente = _mapper.Map<Cliente>(clientebase);
            await _repositorio.Crear(cliente);
            clientebase = _mapper.Map<ClienteBase>(cliente);
            return Ok(clientebase);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> ActualizarCliente(int id, [FromBody] ClienteBase clientebase)
        {
            var validacion = _validator.Validate(clientebase);
            if (!validacion.IsValid)
            {
                var errors = validacion.Errors.Select(x => x.ErrorMessage);
                return BadRequest(new RespuestaClienteDto { Errors = errors });
            }
            var clientebd = _repositorio.ConsultaPorId(x => x.IdClientes == id);
            if(clientebd != null)
            {
                _mapper.Map(clientebase, clientebd);
                await _repositorio.Actualizar(clientebd);
                clientebase = _mapper.Map<ClienteBase>(clientebd);
                return Ok(clientebase);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El cliente que desea actualizar no existe." });
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<ClienteDto>> EliminarCliente(int id)
        {
            var clienteBd = _repositorio.ConsultaPorId(x => x.IdClientes == id);
            if(clienteBd != null)
            {
               await _repositorio.Eliminar(clienteBd);
                return Ok(clienteBd);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El cliente no existe en la base de datos." });
            }
        }
    }
}
