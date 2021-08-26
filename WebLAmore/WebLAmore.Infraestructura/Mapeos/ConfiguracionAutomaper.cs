using AutoMapper;
using WebLAmore.Core.DTO.Request;
using WebLAmore.Core.Modelos;

namespace WebLAmore.Infraestructura.Mapeos
{
    public class ConfiguracionAutomaper: Profile
    {
        public ConfiguracionAutomaper()
        {
            CreateMap<Cliente, ClienteDto>().ReverseMap();
            CreateMap<Cliente, ClienteBase>().ReverseMap();

            CreateMap<DetallePedido, DetallePedidoDto>()
             .ForMember(x => x.Producto, y => y.MapFrom(z => z.Producto));
            CreateMap<DetallePedido, DetallePedidoBase>().ReverseMap();

            CreateMap<Producto, ProductoBase>().ReverseMap();
            CreateMap<Producto, ProductoDto>().ReverseMap();

            CreateMap<Pedido, PedidoDto>()
                .ForMember(x => x.Cliente, y => y.MapFrom(x => x.Cliente));
            CreateMap<Pedido, PedidoBase>().ReverseMap();

            CreateMap<Usuario, RegistroUsuarioDto>().ReverseMap();
        }
    }
}
