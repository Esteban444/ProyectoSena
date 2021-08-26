using FluentValidation;
using WebLAmore.Core.DTO.Request;

namespace WebLAmore.Infraestructura.Validaciones
{
    public class ValidacionDetalle: AbstractValidator<DetallePedidoBase> 
    {
        public ValidacionDetalle() 
        {
            RuleFor(x => x.PedidosId).GreaterThan(0).WithMessage("El pedido deve existir en la tabla Pedidos.");
            RuleFor(x => x.ProductosId).GreaterThan(0).WithMessage("El pedido deve existir en la tabla Productos.");
            RuleFor(x => x.Cantidad).NotEmpty().WithMessage("El campo Cantidad no puede ir vacío.");
            RuleFor(x => x.Valor).NotEmpty().WithMessage("El campo Valor no puede ir vacío.");

        }
    }
}
