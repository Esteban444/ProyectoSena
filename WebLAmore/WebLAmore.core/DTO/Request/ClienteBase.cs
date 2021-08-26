

namespace WebLAmore.Core.DTO.Request
{
    public class ClienteBase
    {
        public decimal Documento { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
    }
}
