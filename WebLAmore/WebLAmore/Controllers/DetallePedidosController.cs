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
using WebLAmore.Core.Interfaces;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class DetallePedidosController : ControllerBase
    {
        private readonly IRepositorioDetallePedido _repositorioBase;
        private readonly IMapper _mapper;
        private readonly IValidator<DetallePedidoBase> _validator;

        public DetallePedidosController(IRepositorioDetallePedido repositorioBase, IMapper mapper, IValidator<DetallePedidoBase> validator)
        {
            _repositorioBase = repositorioBase; 
            _mapper = mapper;
            _validator = validator;
        }

        [HttpGet]
        public  ActionResult ConsultaDellePedidos()
        {
            var detalles =  _repositorioBase.Consultas();
            var detallesDto = _mapper.Map<IEnumerable<DetallePedidoDto>>(detalles);
            return Ok(detallesDto);
        }

        [HttpGet("{id}")]
        public ActionResult<DetallePedidoDto> ConsultaPorId(int id)
        {
            var detallebd = _repositorioBase.ConsultaPorId(x => x.IdDetalle == id);
            if (detallebd != null)
            {
                var detalleDto = _mapper.Map<DetallePedidoDto>(detallebd);
                return Ok(detalleDto);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El detalle no existe en la base de datos" });
            }
        }

        [HttpPost]
        public async Task<ActionResult> CrearDetallePedido(DetallePedidoBase detallebase)
        {
            var validacion = _validator.Validate(detallebase); 
            if (!validacion.IsValid)
            {
                var errors = validacion.Errors.Select(x => x.ErrorMessage);
                return BadRequest(new RespuestaDetalleDto { Errors = errors });
            }
            var detalle = _mapper.Map<DetallePedido>(detallebase);
            await _repositorioBase.Crear(detalle);
            detallebase = _mapper.Map<DetallePedidoBase>(detalle);
            return Ok(detallebase);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> ActualizarDetallePedido(int id, [FromBody] DetallePedidoBase detallebase)
        {
            var validacion = _validator.Validate(detallebase);
            if (!validacion.IsValid)
            {
                var errors = validacion.Errors.Select(x => x.ErrorMessage);
                return BadRequest(new RespuestaDetalleDto { Errors = errors });
            }
            var detallebd = _repositorioBase.ConsultaPorId(x => x.IdDetalle == id);
            if (detallebd != null)
            {
                _mapper.Map(detallebase, detallebd);
                await _repositorioBase.Actualizar(detallebd);
                detallebase = _mapper.Map<DetallePedidoBase>(detallebd);
                return Ok(detallebase);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El detalle que desea actualizar no existe." });
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<DetallePedidoDto>> EliminarDetallePedido(int id)
        {
            var detalleBd = _repositorioBase.ConsultaPorId(x => x.IdDetalle == id);
            if (detalleBd != null)
            {
                await _repositorioBase.Eliminar(detalleBd);
                return Ok(detalleBd);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El detalle no existe en la base de datos." });
            }
        }
    }
}
