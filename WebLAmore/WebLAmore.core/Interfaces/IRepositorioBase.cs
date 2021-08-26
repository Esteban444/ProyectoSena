using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace WebLAmore.core.Interfaces
{
    public interface IRepositorioBase<T>
    {
        IQueryable<T> Consultas();
        T ConsultaPorId(Expression<Func<T, bool>> predicado);
        IQueryable<T> ConsultaPor(Expression<Func<T, bool>> predicado);
        T GetSingle(Expression<Func<T, bool>> predicate);
        Task Crear(T modelo);
        Task Actualizar(T modelo);
        Task Eliminar(T modelo);
    }
}
