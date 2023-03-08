using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class Supplier
    {
        public Supplier()
        {
            ImportProducts = new HashSet<ImportProduct>();
            InforImports = new HashSet<InforImport>();
            ReturnImportProducts = new HashSet<ReturnImportProduct>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }

        public virtual ICollection<ImportProduct> ImportProducts { get; set; }
        public virtual ICollection<InforImport> InforImports { get; set; }
        public virtual ICollection<ReturnImportProduct> ReturnImportProducts { get; set; }

        public static implicit operator Supplier(Customer v)
        {
            throw new NotImplementedException();
        }
    }
}
