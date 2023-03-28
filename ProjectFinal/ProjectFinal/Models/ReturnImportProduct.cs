using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class ReturnImportProduct
    {
        public ReturnImportProduct()
        {
            ProductReturnImports = new HashSet<ProductReturnImport>();
        }

        public int Id { get; set; }
        public DateTime? Date { get; set; }
        public decimal? Totalbill { get; set; }
        public string? Username { get; set; }
        public int? Suppiler { get; set; }
        public int? Idimport { get; set; }

        public virtual ImportProduct? IdimportNavigation { get; set; }
        public virtual Supplier? SuppilerNavigation { get; set; }
        public virtual User? UsernameNavigation { get; set; }
        public virtual ICollection<ProductReturnImport> ProductReturnImports { get; set; }
    }
}
