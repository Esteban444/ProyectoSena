using FluentValidation;
using WebLAmore.Core.DTO.Request;

namespace WebLAmore.Infraestructura.Validaciones
{
    public class ValidacionCliente: AbstractValidator<ClienteBase>
    {
        public ValidacionCliente()
        {
            RuleFor(x => x.Nombres).NotEmpty().WithMessage("El campo Nobres no puede ir vacío");
            RuleFor(x => x.Apellidos).NotEmpty().WithMessage("El campo Apellidos no puede ir vacío");
            RuleFor(x => x.Direccion).NotEmpty().WithMessage("El campo Direccion no puede ir vacío");
            RuleFor(x => x.Telefono).NotEmpty().WithMessage("El campo Telefono no puede ir vacío");
        }
    }
}
