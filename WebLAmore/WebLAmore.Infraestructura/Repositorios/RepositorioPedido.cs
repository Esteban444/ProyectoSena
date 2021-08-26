using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebLAmore.Core.DTO.Request;
using WebLAmore.Core.FiltrosBusqueda;
using WebLAmore.Core.Interfaces;
using WebLAmore.Core.Modelos;
using WebLAmore.Infraestructura.Data;

namespace WebLAmore.Infraestructura.Repositorios
{
    public class RepositorioPedido : RepositorioBase<Pedido>, IRepositorioPedido
    {
        public WebLAmoreContext LAmoreContext { get; set; }
        private readonly IMapper _mapper;
        public RepositorioPedido(WebLAmoreContext context,IMapper mapper): base(context)
        {
            LAmoreContext = context;
            _mapper = mapper;
        }
        public async Task<List<Pedido>> ConsultaData(BusquedaPedido filtro)
        {
            var pedidos = await LAmoreContext.Pedidos.Include(x => x.Cliente).ToListAsync();

            if (filtro.Fecha != null)
            {
                pedidos = pedidos.Where(x => x.Fecha == filtro.Fecha).ToList();
            }
            return pedidos; 
        }

        public async Task<Pedido> CrearPedidoDetalle(PedidoBase pedido) 
        {
            using var transaction = LAmoreContext.Database.BeginTransaction();
            var tablepedido = new Pedido(); 
            try
            {
                tablepedido = _mapper.Map<Pedido>(pedido);
                LAmoreContext.Pedidos.Add(tablepedido);
                await LAmoreContext.SaveChangesAsync();

                foreach (var item in pedido.DetallePedido)  
                {
                    var detalle = _mapper.Map<DetallePedido>(item);

                    detalle.PedidosId = tablepedido.IdPedido;
                    LAmoreContext.DetallePedidos.Add(detalle);
                }
                await LAmoreContext.SaveChangesAsync();
                transaction.Commit();

            }
            catch (Exception e)
            {
                transaction.Rollback();
                throw new Exception("No se guardaron los cambios.",e);
            }
            return tablepedido;

        
        }
    }
}
