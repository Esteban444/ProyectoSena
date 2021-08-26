using System.Collections.Generic;

namespace WebLAmore.Core.DTO.Request
{
    public class PedidoDto: PedidoBase
    {
        public int IdPedido { get; set; }
  
        public ClienteDto Cliente { get; set; }
    }
}
