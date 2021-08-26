using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Infraestructura.Data.Configuracion
{
    public class ConfiguracionProductos : IEntityTypeConfiguration<Producto>
    {
        public void Configure(EntityTypeBuilder<Producto> builder)
        {
            builder.ToTable("Productos");

            builder.HasKey(e => e.IdProducto)
                    .HasName("PK__Producto__07F4A132E7A37E12");

            builder.Property(e => e.IdProducto).HasColumnName("idProducto");

            builder.Property(e => e.Cantidad).HasColumnName("cantidad");

            builder.Property(e => e.NombreProducto)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("nombreProducto");

            builder.Property(e => e.Precio)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("precio");
        }
    }
}
