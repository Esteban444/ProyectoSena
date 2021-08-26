using FluentValidation;
using WebLAmore.Core.DTO.Request;

namespace ManejoExtintores.Infraestructura.Validaciones
{
    public class ValidacionVerificacionDosPasos: AbstractValidator<VerificacionEnDosPasosDto>
    {
        public ValidacionVerificacionDosPasos()
        {
            RuleFor(x => x.Email).NotEmpty().WithMessage("El campo Email no puede ir vacío");
            RuleFor(x => x.Provider).NotEmpty().WithMessage("El campo Provider no puede ir vacío");
            RuleFor(x => x.Token).NotEmpty().WithMessage("El campo Token no puede ir vacío");
        }
    }
}
