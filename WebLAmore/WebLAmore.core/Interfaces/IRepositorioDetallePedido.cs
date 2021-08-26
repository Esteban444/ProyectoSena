using System.Collections.Generic;
using System.Threading.Tasks;
using WebLAmore.core.Interfaces;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Core.Interfaces
{
    public interface IRepositorioDetallePedido : IRepositorioBase<DetallePedido>
    {
        Task<List<DetallePedido>> ColsultaData(); 
    }
}
