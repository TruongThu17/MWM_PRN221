using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class ListProductBill
    {
        public int? Idproduct { get; set; }
        public int? Idbill { get; set; }
        public int? Quatity { get; set; }
        public double? Discount { get; set; }

        public virtual Billed? IdbillNavigation { get; set; }
        public virtual Product? IdproductNavigation { get; set; }
    }
}
