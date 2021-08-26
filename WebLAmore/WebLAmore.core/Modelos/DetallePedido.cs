
namespace WebLAmore.Core.Modelos 
{
    public class DetallePedido
    {
        public int IdDetalle { get; set; }
        public int? PedidosId { get; set; }
        public int? ProductosId { get; set; }
        public int? Cantidad { get; set; }
        public decimal? Valor { get; set; } 

        public Pedido Pedido { get; set; }
        public Producto Producto { get; set; } 
    }
}
