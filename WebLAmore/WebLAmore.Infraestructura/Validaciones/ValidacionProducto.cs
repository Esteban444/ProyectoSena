using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebLAmore.Core.DTO.Request;

namespace WebLAmore.Infraestructura.Validaciones
{
    public class ValidacionProducto: AbstractValidator<ProductoBase>
    {
        public ValidacionProducto()
        {
            RuleFor(x => x.NombreProducto).NotEmpty().WithMessage("El campo NobreProducto no puede ir vacío");
            RuleFor(x => x.Cantidad).NotEmpty().WithMessage("El campo Cantidad no puede ir vacío");
            RuleFor(x => x.Precio).NotEmpty().WithMessage("El campo Precio no puede ir vacío");
            //RuleFor(x => x.Telefono).NotEmpty().WithMessage("El campo Telefono no puede ir vacío");
        }

    }
}
