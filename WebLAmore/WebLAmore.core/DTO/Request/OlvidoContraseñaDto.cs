using System.ComponentModel.DataAnnotations;

namespace WebLAmore.Core.DTO.Request
{
    public class OlvidoContraseñaDto
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        public string ClientURI { get; set; }
    }
}
