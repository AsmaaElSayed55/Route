using RouteDAL.Data.Contexts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RouteDAL.Repositories
{
    // Primary Constructor .Net 8
    public class DepartmentRepository(ApplicationDbContext dbContext)
    {
        private readonly ApplicationDbContext _dbContext = dbContext;

        //private readonly ApplicationDbContext _dbContext;
        //public DepartmentRepository(ApplicationDbContext dbContext) {

        //    // Ask CLR For Creating Object From ApplicationDbContext
        //    _dbContext = dbContext;
        //}

        // CRUD =>
        // Get ALL
        // Get Department By Id
        //ApplicationDbContext dbContext=new ApplicationDbContext();

        public IEnumerable<Department> GetAll(bool WithTracking=false)
        {
            if(WithTracking)
            {
                return _dbContext.Departments.ToList();
            }
            else
            {
                return _dbContext.Departments.AsNoTracking().ToList();
            }
        }

        public Department? GetById(int id /*, ApplicationDbContext dbContext */)
        {
            var Department = _dbContext.Departments.Find(id);
            return Department;
        }
        // Add

        public int Add(Department department)
        {
            _dbContext.Departments.Add(department); // Local
            return _dbContext.SaveChanges();
        }

        // Update

        public int Update(Department department)
        {
            _dbContext.Departments.Update(department);
            return _dbContext.SaveChanges();
        }
         
        // Delete

        public int Remove(Department department)
        {
            _dbContext.Departments.Remove(department);
            return _dbContext.SaveChanges();
        }

    }
}
