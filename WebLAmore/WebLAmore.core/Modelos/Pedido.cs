using System;
using System.Collections.Generic;


namespace WebLAmore.Core.Modelos 
{
    public class Pedido
    {
        public int IdPedido { get; set; }
        public int? ClienteId { get; set; }
        public DateTime? Fecha { get; set; }
        public int? Estado { get; set; }

        public Cliente Cliente { get; set; }
        public ICollection<DetallePedido> DetallePedidos { get; set; }
    }
}
