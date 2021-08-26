using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebLAmore.Core.FiltrosBusqueda;
using WebLAmore.Core.Interfaces;
using WebLAmore.Core.Modelos;
using WebLAmore.Infraestructura.Data;

namespace WebLAmore.Infraestructura.Repositorios
{
    public class RepositorioClientes : RepositorioBase<Cliente>, IRepositorioClientes
    { 
        public WebLAmoreContext _WebLAmore { get; set; }
        public RepositorioClientes(WebLAmoreContext context) : base(context)
        {
            _WebLAmore = context;
        }
        public async Task<List<Cliente>> ConsultarClientes(BusquedaClientes filtro)
        {
            var clientes =  await _WebLAmore.Clientes.ToListAsync();

            if (filtro.Nombres != null)
            {
                clientes = clientes.Where(x => x.Nombres.ToLower().Contains(filtro.Nombres.ToLower())).ToList();
            }

            if (filtro.Apellidos != null)
            {
                clientes = clientes.Where(x => x.Apellidos.ToLower().Contains(filtro.Apellidos.ToLower())).ToList();
            }

            return clientes;
        }
    }
}
