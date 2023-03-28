using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class ImportProduct
    {
        public ImportProduct()
        {
            InforImports = new HashSet<InforImport>();
            ReturnImportProducts = new HashSet<ReturnImportProduct>();
        }

        public int Id { get; set; }
        public string UserName { get; set; } = null!;
        public DateTime? DateImport { get; set; }
        public decimal? TotalBill { get; set; }
        public int? Supplier { get; set; }
        public string? CodeImport { get; set; }
        public int? Discount { get; set; }

        public virtual Supplier? SupplierNavigation { get; set; }
        public virtual User UserNameNavigation { get; set; } = null!;
        public virtual ICollection<InforImport> InforImports { get; set; }
        public virtual ICollection<ReturnImportProduct> ReturnImportProducts { get; set; }
    }
}
