using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class InforImport
    {
        public int Idimport { get; set; }
        public int Idproduct { get; set; }
        public decimal ImportPrice { get; set; }
        public DateTime DateExpiry { get; set; }
        public double Discount { get; set; }
        public int SupplierId { get; set; }
        public DateTime DateImport { get; set; }
        public int QuantityImport { get; set; }
        public string Shelves { get; set; } = null!;

        public virtual ImportProduct IdimportNavigation { get; set; } = null!;
        public virtual Product IdproductNavigation { get; set; } = null!;
        public virtual Supplier Supplier { get; set; } = null!;
    }
}
