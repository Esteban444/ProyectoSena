using System.Collections.Generic;

namespace WebLAmore.Core.DTO.Response
{
    public class RespuestaRegistroDto
    {
        public bool RegistroExitoso { get; set; }
        public IEnumerable<string> Errors { get; set; }
    }
}
