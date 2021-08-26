using FluentValidation;
using WebLAmore.Core.DTO.Request;

namespace ManejoExtintores.Infraestructura.Validaciones
{
    public class ValidacionAutenticacionUsuario:AbstractValidator<AutenticacionUsuarioDto>
    {
        public ValidacionAutenticacionUsuario()
        {
            RuleFor(x => x.Email).NotEmpty().WithMessage("El campo Email no puede ir vacío");
            RuleFor(x => x.Password).NotEmpty().WithMessage("El campo Password no puede ir vacío");
        }
    }
}
