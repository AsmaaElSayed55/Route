namespace Route.Project.DAL.Models
{
    internal class BaseEntity // Include The Common Properties [Parent] 
    {
        public int Id { get; set; }
        public int CreatedBy {  get; set; }
        public DateTime? CreatedOn { get; set; }
        public int ModifiedBy { get; set;}
        public DateTime? ModifiedOn { get; set; }
        public bool IsDeleted { get; set; } // Soft Delete
    }
}
