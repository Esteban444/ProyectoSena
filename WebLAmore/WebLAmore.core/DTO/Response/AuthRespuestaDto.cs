

namespace WebLAmore.Core.DTO.Response
{
    public class AuthRespuestaDto
    {
        public bool AuthExitosa { get; set; }
        public string MensajeError { get; set; }
        public string Token { get; set; }
        public bool Verificacion { get; set; }
        public string Proveedor { get; set; }
    }
}
