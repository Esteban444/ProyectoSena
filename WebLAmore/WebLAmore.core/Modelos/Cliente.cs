using System.Collections.Generic;

namespace WebLAmore.Core.Modelos  
{
    public class Cliente
    {
        public int IdClientes { get; set; }
        public decimal? Documento { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }

        public ICollection<Pedido> Pedidos { get; set; }
    }
}
