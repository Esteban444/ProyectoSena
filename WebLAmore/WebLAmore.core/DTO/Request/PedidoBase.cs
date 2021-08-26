using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebLAmore.Core.DTO.Request
{
    public class PedidoBase
    {
        public int? ClienteId { get; set; }
        [DataType(DataType.Date)]
        public DateTime? Fecha { get; set; }
        public int? Estado { get; set; }

        public List<DetallePedidoBase> DetallePedido { get; set; }  
    }
}
