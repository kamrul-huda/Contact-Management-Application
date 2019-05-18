using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactManagement.Repository.RepositoryInteface
{
    public interface IRepository<T> where T : class
    {
        bool? Delete(T entity);
        bool? Delete<MT>(MT entity) where MT : class;

        System.Data.Entity.DbSet<T> Entities { get; }
        System.Data.Entity.DbSet<PT> Entity<PT>() where PT : class;

        T Get(params object[] keyValues);
        MT Get<MT>(params object[] keyValues) where MT : class;
        System.Collections.Generic.IEnumerable<T> GetEnumerator(string qurey, params object[] parameters);

        bool? Insert(T entity);
        bool? Insert<MT>(MT entity) where MT : class;

        bool? Update(T entity, params object[] keyValues);
        bool? Update<MT>(MT entity, params object[] keyValues) where MT : class;
    }
}

