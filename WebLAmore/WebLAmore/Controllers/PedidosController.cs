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

namespace WebLAmore.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PedidosController : ControllerBase
    {
        private readonly IRepositorioPedido _repositorio;
        private readonly IMapper _mapper;
        private readonly IValidator<PedidoBase> _validator;

        public PedidosController(IRepositorioPedido repositorio, IMapper mapper, IValidator<PedidoBase> validator)
        {
            _repositorio = repositorio;
            _mapper = mapper;
            _validator = validator;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<PedidoDto>>> ConsultaClientes([FromQuery] BusquedaPedido filtro)
        {
            var pedidos = await _repositorio.ConsultaData(filtro);
            var pedidosDto = _mapper.Map<IEnumerable<PedidoDto>>(pedidos);
            return Ok(pedidosDto);
        }

        [HttpGet("{id}")]
        public ActionResult<PedidoDto> ConsultaPorId(int id)
        {
            var pedidobd = _repositorio.ConsultaPorId(x => x.IdPedido == id);
            if (pedidobd != null)
            {
                var pedidoDto = _mapper.Map<PedidoDto>(pedidobd);
                return Ok(pedidoDto);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El pedido no existe en la base de datos" });
            }
        }

        [HttpPost("Crear-Pedido-Detalle")]
        public async Task<ActionResult> CrearPedido(PedidoBase pedidobase)
        {
            var validacion = _validator.Validate(pedidobase);
            if (!validacion.IsValid)
            {
                var errors = validacion.Errors.Select(x => x.ErrorMessage);
                return BadRequest(new RespuestaPedidoDto { Errors = errors });
            }
            await _repositorio.CrearPedidoDetalle(pedidobase);
            return Ok(pedidobase);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> ActualizarPedido(int id, [FromBody] PedidoBase pedidobase)
        {
            var validacion = _validator.Validate(pedidobase);
            if (!validacion.IsValid)
            {
                var errors = validacion.Errors.Select(x => x.ErrorMessage);
                return BadRequest(new RespuestaPedidoDto { Errors = errors });
            }
            var pedidobd = _repositorio.ConsultaPorId(x => x.IdPedido == id);
            if (pedidobd != null)
            {
                _mapper.Map(pedidobase, pedidobd);
                await _repositorio.Actualizar(pedidobd);
                pedidobase = _mapper.Map<PedidoBase>(pedidobd);
                return Ok(pedidobase);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El pedido que desea actualizar no existe." });
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<PedidoDto>> EliminarPedido(int id)
        {
            var pedidoBd = _repositorio.ConsultaPorId(x => x.IdPedido == id);
            if (pedidoBd != null)
            {
                await _repositorio.Eliminar(pedidoBd);
                return Ok(pedidoBd);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El pedido no existe en la base de datos." });
            }
        }
    }
}
