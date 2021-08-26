using MimeKit;
using MailKit.Net.Smtp;
using System.IO;
using System.Linq;
using System.Threading.Tasks;


namespace WebLAmore.Infraestructura.ServicioEmail
{
    public class EmailSender: IEmailSender
    {
        private readonly ConfiguracionEmail _emailConfig;

        public EmailSender(ConfiguracionEmail emailConfig)
        {
            _emailConfig = emailConfig;
        }

        public void SendEmail(Mensaje mensaje)
        {
            var emailMessage = CrearEmailMensaje(mensaje);

            Send(emailMessage);
        }

        public async Task SendEmailAsync(Mensaje mensaje)
        {
            var mailMensaje = CrearEmailMensaje(mensaje);

            await SendAsync(mailMensaje);
        }

        private MimeKit.MimeMessage CrearEmailMensaje(Mensaje mensaje)
        {
            var emailMessage = new MimeMessage();
            emailMessage.From.Add(new MailboxAddress(_emailConfig.From));
            emailMessage.To.AddRange(mensaje.To);
            emailMessage.Subject = mensaje.Sujeto;

            var bodyBuilder = new BodyBuilder { HtmlBody = string.Format("<h2 style='color:red;'>{0}</h2>", mensaje.Contenido) };

            if (mensaje.Archivos != null && mensaje.Archivos.Any())
            {
                byte[] bytearchivo;
                foreach (var archivo in mensaje.Archivos)
                {
                    using (var ms = new MemoryStream())
                    {
                        archivo.CopyTo(ms);
                        bytearchivo = ms.ToArray();
                    }

                    bodyBuilder.Attachments.Add(archivo.FileName, bytearchivo, ContentType.Parse(archivo.ContentType));
                }
            }

            emailMessage.Body = bodyBuilder.ToMessageBody();
            return emailMessage;
        }

        private void Send(MimeMessage mailMessage)
        {
            using (var client = new SmtpClient())
            {
                try
                {
                    client.Connect(_emailConfig.SmtpServer, _emailConfig.Port, true);
                    client.AuthenticationMechanisms.Remove("XOAUTH2");
                    client.Authenticate(_emailConfig.UserName, _emailConfig.Password);

                    client.Send(mailMessage);
                }
                catch
                {
                    //log an error message or throw an exception, or both.
                    throw;
                }
                finally
                {
                    client.Disconnect(true);
                    client.Dispose();
                }
            }
        }

        private async Task SendAsync(MimeMessage mailMessage)
        {
            using (var client = new SmtpClient())
            {
                try
                {
                    await client.ConnectAsync(_emailConfig.SmtpServer, _emailConfig.Port, true);
                    client.AuthenticationMechanisms.Remove("XOAUTH2");
                    await client.AuthenticateAsync(_emailConfig.UserName, _emailConfig.Password);

                    await client.SendAsync(mailMessage);
                }
                catch
                {
                    //log an error message or throw an exception, or both.
                    throw;
                }
                finally
                {
                    await client.DisconnectAsync(true);
                    client.Dispose();
                }
            }
        }
    }
}
