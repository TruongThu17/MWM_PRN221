using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class User
    {
        public User()
        {
            Billeds = new HashSet<Billed>();
            ImportProducts = new HashSet<ImportProduct>();
        }

        public string Username { get; set; } = null!;
        public string Password { get; set; } = null!;
        public int? Role { get; set; }
        public string? Name { get; set; }
        public string? Image { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? Email { get; set; }
        public bool Status { get; set; }

        public virtual Role? RoleNavigation { get; set; }
        public virtual ICollection<Billed> Billeds { get; set; }
        public virtual ICollection<ImportProduct> ImportProducts { get; set; }
    }
}
