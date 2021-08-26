using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Infraestructura.Data.Configuracion
{
    public class ConfiguracionCliente : IEntityTypeConfiguration<Cliente>
    {
        public void Configure(EntityTypeBuilder<Cliente> builder)
        {
            builder.ToTable("Clientes");

            builder.HasKey(e => e.IdClientes)
                   .HasName("PK__Clientes__470BDBA063267154");

            builder.Property(e => e.IdClientes).HasColumnName("idClientes");

            builder.Property(e => e.Apellidos)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("apellidos");

            builder.Property(e => e.Direccion)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("direccion");

            builder.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("email");

            builder.Property(e => e.Nombres)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("nombres");

            builder.Property(e => e.Telefono)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("telefono");

            builder.Property(e => e.Documento).HasColumnType("decimal(18, 0)").HasColumnName("documento");
        }
    }

}
