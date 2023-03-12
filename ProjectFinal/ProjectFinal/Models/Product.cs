using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class Product
    {
        public Product()
        {
            InforImports = new HashSet<InforImport>();
            ProductsInBills = new HashSet<ProductsInBill>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Producer { get; set; }
        public int ProductType { get; set; }
        public bool Status { get; set; }
        public string? Unit { get; set; }
        public decimal? SalePrice { get; set; }
        public int? QuantityInStock { get; set; }
        public int? QuantityOrder { get; set; }

        public virtual ProductType ProductTypeNavigation { get; set; } = null!;
        public virtual ICollection<InforImport> InforImports { get; set; }
        public virtual ICollection<ProductsInBill> ProductsInBills { get; set; }
    }
}
