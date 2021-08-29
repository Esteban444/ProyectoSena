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
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : ControllerBase
    {
        private readonly IRepositorioProductos _repositorio;
        private readonly IMapper _mapper;
        private readonly IValidator<ProductoBase> _validator;

        public ProductosController(IRepositorioProductos repositorio, IMapper mapper, IValidator<ProductoBase> validator)
        {
            _repositorio = repositorio; 
            _mapper = mapper;
            _validator = validator;
        }
         
        [HttpGet] 
        public async Task<ActionResult<IEnumerable<ProductoDto>>> ConsultarProductos([FromQuery] BuscarProductos filtro)
        {
            var productos = await _repositorio.ConsultaProductos(filtro); 
            var productosDto = _mapper.Map<IEnumerable<ProductoDto>>(productos);
            return Ok(productosDto);
        }

        [HttpGet("{id}")]
        public ActionResult<ProductoDto> ConsultaPorId(int id)
        {
            var productobd = _repositorio.ConsultaPorId(x => x.IdProducto == id);
            if (productobd != null)
            {
                var productoDto = _mapper.Map<ProductoDto>(productobd);
                return Ok(productoDto);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El producto no existe en la base de datos" });
            }
        }

        [HttpPost]
        public async Task<ActionResult> CrearProducto(ProductoBase productobase)
        {
            var validacion = _validator.Validate(productobase);
            if (!validacion.IsValid)
            {
                var errors = validacion.Errors.Select(x => x.ErrorMessage);
                return BadRequest(new RespuestaProductoDto { Errors = errors });
            }
            var producto = _mapper.Map<Producto>(productobase);
            await _repositorio.Crear(producto);
            productobase = _mapper.Map<ProductoBase>(producto);
            return Ok(productobase);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> ActualizarProducto(int id, [FromBody] ProductoBase productobase)
        {
            var validacion = _validator.Validate(productobase);
            if (!validacion.IsValid)
            {
                var errors = validacion.Errors.Select(x => x.ErrorMessage);
                return BadRequest(new RespuestaProductoDto { Errors = errors });
            }
            var productobd = _repositorio.ConsultaPorId(x => x.IdProducto == id);
            if (productobd != null)
            {
                _mapper.Map(productobase, productobd);
                await _repositorio.Actualizar(productobd);
                productobase = _mapper.Map<ProductoBase>(productobd);
                return Ok(productobase);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El producto que desea actualizar no existe." });
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<ProductoDto>> EliminarProducto(int id)
        {
            var productoBd = _repositorio.ConsultaPorId(x => x.IdProducto == id);
            if (productoBd != null)
            {
                await _repositorio.Eliminar(productoBd);
                return Ok(productoBd);
            }
            else
            {
                throw new ManejoExcepciones(HttpStatusCode.NotFound, new { mensaje = "El producto no existe en la base de datos." });
            }
        }
    }
}
