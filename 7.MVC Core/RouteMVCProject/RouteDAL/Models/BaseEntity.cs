using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RouteDAL.Models
{
    public class BaseEntity
    {
        public int Id { get; set; } //Pk
        public int CreatedBy { get; set; } // UserId
        public DateTime? CreatedOn { get; set; }
        public int LastModificationBy { get; set; } // UserId
        public DateTime? LastModificationOn { get; set; }
        public bool IsDelated { get; set; } // SoftDelete

    }
}
