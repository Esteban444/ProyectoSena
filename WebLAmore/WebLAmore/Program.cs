using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using WebLAmore.Core.Modelos;
using WebLAmore.Infraestructura.Data;

namespace WebLAmore
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var hostserver = CreateHostBuilder(args).Build();
            using (var ambiente = hostserver.Services.CreateScope())
            {
                var services = ambiente.ServiceProvider;
                try
                {
                    var userManager = services.
                    GetRequiredService<UserManager<Usuario>>();
                    var context = services.GetRequiredService<WebLAmoreContext>();
                    context.Database.Migrate();
                    
                }
                catch (Exception)
                {
                    
                }
            }
            hostserver.Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
