using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebLAmore.Core.Interfaces;
using WebLAmore.Core.Modelos;
using WebLAmore.Infraestructura.Data;

namespace WebLAmore.Infraestructura.Repositorios
{
    public class RepositorioDetallePedido : RepositorioBase<DetallePedido>, IRepositorioDetallePedido
    {
        public WebLAmoreContext LAmoreContext { get; set; }

        public RepositorioDetallePedido(WebLAmoreContext context): base(context)
        {
            LAmoreContext = context;
        }
        public async Task<List<DetallePedido>> ColsultaData()
        {
            var detalle = await LAmoreContext.DetallePedidos.Include(x => x.Producto).ToListAsync();
            return detalle;
        }
    }
}
