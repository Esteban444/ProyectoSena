using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using WebLAmore.core.Interfaces;
using WebLAmore.Infraestructura.Data;

namespace WebLAmore.Infraestructura.Repositorios
{
    public class RepositorioBase<T> : IRepositorioBase<T> where T : class, new()
    {
        public WebLAmoreContext DatabaseContext { get; set; }

        public RepositorioBase(WebLAmoreContext context)
        {
            DatabaseContext = context;
        }

        public IQueryable<T> Consultas()
        {
            var modeloset = DatabaseContext.Set<T>();
            return modeloset.AsQueryable();
        }
        public T ConsultaPorId(Expression<Func<T, bool>> predicado)
        {
            return Consultas().FirstOrDefault(predicado);
        }
        public T GetSingle(Expression<Func<T, bool>> predicate)
        {
            return Consultas().FirstOrDefault(predicate);
        }

        public async Task Crear(T modelo)
        {
            await DatabaseContext.AddAsync(modelo);
            await DatabaseContext.SaveChangesAsync();

        }

        public IQueryable<T> ConsultaPor(Expression<Func<T, bool>> predicado)
        {
            return Consultas().Where(predicado);
        }
        public async Task Actualizar(T modelo)
        {
            var actualizarT = modelo.GetType().GetProperty("TiempoModi");
            if (actualizarT != null) modelo.GetType().GetProperty("TiempoModi").SetValue(modelo, DateTime.Now);
            DatabaseContext.Update(modelo);
            await DatabaseContext.SaveChangesAsync();

        }

        public async Task Eliminar(T modelo)
        {
            var actulizarEli = modelo.GetType().GetProperty("IsDelete");
            if (actulizarEli != null)
            {
                modelo.GetType().GetProperty("IsDelete").SetValue(modelo, true);

                var actualizar = modelo.GetType().GetProperty("TiempoEli");
                if (actualizar != null) modelo.GetType().GetProperty("TiempoEli").SetValue(modelo, DateTime.Now);
                DatabaseContext.Update(modelo);
            }
            else
            {
                DatabaseContext.Remove(modelo);
            }
            await DatabaseContext.SaveChangesAsync();
        }
    }
}
