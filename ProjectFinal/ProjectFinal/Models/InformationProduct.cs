using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class InformationProduct
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public double? ImportPrice { get; set; }
        public double? SalePrice { get; set; }
        public DateTime? DateExpiry { get; set; }
        public int? QuantityInstock { get; set; }
        public string? Unit { get; set; }
        public bool Status { get; set; }
        public int? SupplierId { get; set; }
        public DateTime? DateImport { get; set; }
        public string? Note { get; set; }
        public int? QuantityImport { get; set; }
        public string? Shelves { get; set; }
        public double? Discount { get; set; }

        public virtual Product Product { get; set; } = null!;
        public virtual Supplier? Supplier { get; set; }
    }
}
