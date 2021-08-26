using System.Collections.Generic;
using System.Threading.Tasks;
using WebLAmore.core.Interfaces;
using WebLAmore.Core.FiltrosBusqueda;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Core.Interfaces
{
    public interface IRepositorioClientes: IRepositorioBase<Cliente>
    {
        Task<List<Cliente>> ConsultarClientes(BusquedaClientes filtro);
    }
}
