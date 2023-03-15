using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Billeds = new HashSet<Billed>();
            Returns = new HashSet<Return>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? Note { get; set; }
        public DateTime? Dob { get; set; }
        public string? Email { get; set; }

        public virtual ICollection<Billed> Billeds { get; set; }
        public virtual ICollection<Return> Returns { get; set; }
    }
}
