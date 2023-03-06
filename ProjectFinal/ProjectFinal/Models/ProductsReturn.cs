using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class ProductsReturn
    {
        public int Idreturn { get; set; }
        public int Idbill { get; set; }
        public int Idproduct { get; set; }
        public int? Quantity { get; set; }
        public double? Discount { get; set; }

        public virtual ProductsInBill Id { get; set; } = null!;
        public virtual Return IdreturnNavigation { get; set; } = null!;
    }
}
