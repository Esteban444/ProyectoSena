using System.Collections.Generic;
using System.Threading.Tasks;
using WebLAmore.core.Interfaces;
using WebLAmore.Core.DTO.Request;
using WebLAmore.Core.FiltrosBusqueda;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Core.Interfaces
{
    public interface IRepositorioPedido: IRepositorioBase<Pedido>
    {
        Task<List<Pedido>> ConsultaData(BusquedaPedido filtro);
        Task<Pedido> CrearPedidoDetalle(PedidoBase pedido); 
    }
}
