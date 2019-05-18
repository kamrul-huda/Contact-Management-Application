using ContactManagement.Domain.Model;
using ContactManagement.Repository.RepositoryInteface;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactManagement.Repository.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private CMAEntities context = ContextInstance;
        protected static CMAEntities ContextInstance
        {
            get { return new CMAEntities(); }
        }
        DbSet<T> _entity;
        public Repository()
        {
            _entity = context.Set<T>();
        }
        private bool? SaveChanges()
        {
            return context.SaveChanges() > 0;
        }
        public DbSet<T> Entities
        {
            get { return _entity; }
        }

        public DbSet<PT> Entity<PT>() where PT : class
        {
            return context.Set<PT>();
        }

        public T Get(params object[] keyValues)
        {
            return _entity.Find(keyValues);
        }

        public MT Get<MT>(params object[] keyValues) where MT : class
        {
            return context.Set<MT>().Find(keyValues);
        }

        public IEnumerable<T> GetEnumerator(string qurey, params object[] parameters)
        {
            return _entity.SqlQuery(qurey, parameters);
        }
        public bool? Insert(T entity)
        {
            _entity.Add(entity);
            return SaveChanges();
        }

        public bool? Insert<MT>(MT entity) where MT : class
        {
            context.Set<MT>().Add(entity);
            return SaveChanges();
        }
        public bool? Update(T entity, params object[] keyValues)
        {
            var entry = context.Entry(entity);
            if (keyValues.Length > 0)
            {
                if (entry.State == EntityState.Detached)
                {
                    T attached = _entity.Find(keyValues);
                    if (attached != null)
                    {
                        var attachedEntry = context.Entry(attached);
                        attachedEntry.CurrentValues.SetValues(entity);
                    }
                    else
                        entry.State = EntityState.Modified;
                }
            }
            else
            {
                entry.State = EntityState.Modified;
            }
            return SaveChanges();
        }
        public bool? Update<MT>(MT entity, params object[] keyValues) where MT : class
        {
            var entry = context.Entry(entity);
            if (keyValues.Length > 0)
            {
                if (entry.State == EntityState.Detached)
                {
                    MT attached = context.Set<MT>().Find(keyValues);
                    if (attached != null)
                    {
                        var attachedEntry = context.Entry(attached);
                        attachedEntry.CurrentValues.SetValues(entity);
                    }
                    else
                        entry.State = EntityState.Modified;
                }
            }
            else
            {
                entry.State = EntityState.Modified;
            }
            return SaveChanges();
        }
        public bool? Delete(T entity)
        {
            context.Entry(entity).State = EntityState.Deleted;
            return SaveChanges();
        }
        public bool? Delete<MT>(MT entity) where MT : class
        {
            context.Entry(entity).State = EntityState.Deleted;
            return SaveChanges();
        }
        public void SetDelete<MT>(MT entity) where MT : class
        {
            context.Entry(entity).State = EntityState.Deleted;
        }
        public bool? ConfirmDelete()
        {
            return SaveChanges();
        }
    }
}

