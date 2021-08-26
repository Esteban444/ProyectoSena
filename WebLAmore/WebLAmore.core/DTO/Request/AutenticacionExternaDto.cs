using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebLAmore.Core.DTO.Request
{
    public class AutenticacionExternaDto
    {
        public string Proveedor { get; set; }
        public string IdToken { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Email { get; set; }
    }
}
