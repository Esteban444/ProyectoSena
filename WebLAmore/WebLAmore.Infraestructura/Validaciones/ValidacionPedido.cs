using FluentValidation;
using WebLAmore.Core.DTO.Request;

namespace WebLAmore.Infraestructura.Validaciones
{
    public class ValidacionPedido:AbstractValidator<PedidoBase>
    {
        public ValidacionPedido() 
        {
            RuleFor(x => x.ClienteId).GreaterThan(0).WithMessage("El cliente deve existir en la tabla Clientes.");
            RuleFor(x => x.Fecha).NotEmpty().WithMessage("El campo Fecha no puede ir vacío.");
            
        }
    }
}
