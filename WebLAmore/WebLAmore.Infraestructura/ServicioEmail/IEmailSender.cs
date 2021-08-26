using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebLAmore.Infraestructura.ServicioEmail
{
    public interface IEmailSender
    {
        void SendEmail(Mensaje mensaje);
        Task SendEmailAsync(Mensaje mensaje);
    }
}
