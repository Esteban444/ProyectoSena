using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Infraestructura.Data.Configuracion
{
    public class ConfiguracionPedido : IEntityTypeConfiguration<Pedido>
    {
        public void Configure(EntityTypeBuilder<Pedido> builder)
        {
            builder.ToTable("Pedidos");

            builder.HasKey(e => e.IdPedido)
                    .HasName("PK__Pedidos__A9F619B70D86878B");

            builder.Property(e => e.IdPedido).HasColumnName("idPedido");

            builder.Property(e => e.ClienteId).HasColumnName("clienteId");

            builder.Property(e => e.Estado).HasColumnName("estado");

            builder.Property(e => e.Fecha)
                .HasColumnType("date")
                .HasColumnName("fecha");

            builder.HasOne(d => d.Cliente)
                .WithMany(p => p.Pedidos)
                .HasForeignKey(d => d.ClienteId)
                .HasConstraintName("FK_Pedidos_Clientes");
        }
    }
}
