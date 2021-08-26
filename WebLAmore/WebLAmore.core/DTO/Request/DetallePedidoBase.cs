

namespace WebLAmore.Core.DTO.Request
{
    public class DetallePedidoBase
    {
        public int? PedidosId { get; set; }
        public int? ProductosId { get; set; }
        public int? Cantidad { get; set; }
        public decimal? Valor { get; set; } 
    }
}
