using System.Collections.Generic;

namespace WebLAmore.Core.Modelos  
{
    public class Producto
    {
        public int IdProducto { get; set; }
        public string NombreProducto { get; set; }
        public int? Cantidad { get; set; }
        public decimal? Precio { get; set; }

        public ICollection<DetallePedido> DetallePedidos { get; set; }
    }
}
