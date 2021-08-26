using Microsoft.AspNetCore.Identity;
using System;

namespace WebLAmore.Core.Modelos 
{
    public class Usuario : IdentityUser
    {
        public string Nombres { get; set; }
        public string Google { get; set; }
        public string Discriminador { get; set; }

        public DateTime? JoinDate { get; set; }
    }
}
