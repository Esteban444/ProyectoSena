using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Reflection;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Infraestructura.Data
{
    public class WebLAmoreContext : IdentityDbContext<Usuario>
    {
        public WebLAmoreContext(DbContextOptions<WebLAmoreContext> options)
            : base(options)
        {
        }

        public  DbSet<Cliente> Clientes { get; set; }
        public  DbSet<DetallePedido> DetallePedidos { get; set; }
        public  DbSet<Pedido> Pedidos { get; set; }
        public  DbSet<Producto> Productos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

            base.OnModelCreating(modelBuilder);
        }

    }
}
