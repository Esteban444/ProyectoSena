using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Infraestructura.Data.Configuracion
{
    public class ConfiguracionDetallePedido : IEntityTypeConfiguration<DetallePedido>
    {
        public void Configure(EntityTypeBuilder<DetallePedido> builder)
        {
            builder.ToTable("DetallePedidos");

            builder.HasKey(e => e.IdDetalle)
                   .HasName("PK__DetalleP__49CAE2FBBD5BAEBE");

            builder.Property(e => e.IdDetalle).HasColumnName("idDetalle");

            builder.Property(e => e.Cantidad).HasColumnName("cantidad");

            builder.Property(e => e.PedidosId).HasColumnName("pedidosId");

            builder.Property(e => e.ProductosId).HasColumnName("productosId");

            builder.Property(e => e.Valor)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("valor");

            builder.HasOne(d => d.Pedido)
                .WithMany(p => p.DetallePedidos)
                .HasForeignKey(d => d.PedidosId)
                .HasConstraintName("FK_DetallePedido_Pedidos");

            builder.HasOne(d => d.Producto)
                .WithMany(p => p.DetallePedidos)
                .HasForeignKey(d => d.ProductosId)
                .HasConstraintName("FK_DetallePedido_Productos");
        }
    }
}
