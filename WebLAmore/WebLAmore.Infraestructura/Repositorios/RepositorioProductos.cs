using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebLAmore.Core.FiltrosBusqueda;
using WebLAmore.Core.Interfaces;
using WebLAmore.Core.Modelos;
using WebLAmore.Infraestructura.Data;

namespace WebLAmore.Infraestructura.Repositorios
{
    public class RepositorioProductos : RepositorioBase<Producto>, IRepositorioProductos
    {
        public WebLAmoreContext _LAmoreContext { get; set; }

        public RepositorioProductos(WebLAmoreContext context) : base(context)
        {
            _LAmoreContext = context;
        }
        public async Task<IEnumerable<Producto>> ConsultaProductos(BuscarProductos filtro)
        {
            var productos = await _LAmoreContext.Productos.ToListAsync();

            if (filtro.NombreProducto != null)
            {
                productos = productos.Where(x => x.NombreProducto.ToLower().Contains(filtro.NombreProducto.ToLower())).ToList();
            }
            return productos;
        }
    }
}
