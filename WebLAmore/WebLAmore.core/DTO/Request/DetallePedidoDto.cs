
namespace WebLAmore.Core.DTO.Request
{
    public class DetallePedidoDto: DetallePedidoBase
    {
        public int IdDetalle { get; set; }

        public ProductoDto Producto { get; set; } 
    }
}
