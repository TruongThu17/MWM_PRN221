using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class Supplier
    {
        public Supplier()
        {
            InforImports = new HashSet<InforImport>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }

        public virtual ICollection<InforImport> InforImports { get; set; }
    }
}
