using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class ProductsInBill
    {
        public ProductsInBill()
        {
            ProductsReturns = new HashSet<ProductsReturn>();
        }

        public int Idbill { get; set; }
        public int Idproduct { get; set; }
        public int Quatity { get; set; }
        public double Discount { get; set; }

        public virtual Billed IdbillNavigation { get; set; } = null!;
        public virtual Product IdproductNavigation { get; set; } = null!;
        public virtual ICollection<ProductsReturn> ProductsReturns { get; set; }
    }
}
