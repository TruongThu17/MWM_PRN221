using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class Return
    {
        public Return()
        {
            ProductsReturns = new HashSet<ProductsReturn>();
        }

        public int Id { get; set; }
        public string Username { get; set; } = null!;
        public int Idcustomer { get; set; }
        public DateTime? Date { get; set; }
        public decimal? Totalbill { get; set; }
        public int? Idbill { get; set; }

        public virtual Billed? IdbillNavigation { get; set; }
        public virtual Customer IdcustomerNavigation { get; set; } = null!;
        public virtual User UsernameNavigation { get; set; } = null!;
        public virtual ICollection<ProductsReturn> ProductsReturns { get; set; }
    }
}
