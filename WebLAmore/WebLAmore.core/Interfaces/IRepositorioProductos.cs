using System.Collections.Generic;
using System.Threading.Tasks;
using WebLAmore.core.Interfaces;
using WebLAmore.Core.FiltrosBusqueda;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Core.Interfaces
{
    public interface IRepositorioProductos: IRepositorioBase<Producto>
    {
        Task<IEnumerable<Producto>> ConsultaProductos(BuscarProductos filtro);
    }
}
