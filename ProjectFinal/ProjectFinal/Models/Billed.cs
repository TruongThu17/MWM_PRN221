using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class Billed
    {
        public Billed()
        {
            ProductsInBills = new HashSet<ProductsInBill>();
            Returns = new HashSet<Return>();
        }

        public int Id { get; set; }
        public string Username { get; set; } = null!;
        public DateTime? DateImport { get; set; }
        public int Idcustomer { get; set; }
        public decimal? TotalBill { get; set; }
        public decimal? Debt { get; set; }
        public decimal? Deposit { get; set; }
        public bool? Status { get; set; }
        public double? Discount { get; set; }

        public virtual Customer IdcustomerNavigation { get; set; } = null!;
        public virtual User UsernameNavigation { get; set; } = null!;
        public virtual ICollection<ProductsInBill> ProductsInBills { get; set; }
        public virtual ICollection<Return> Returns { get; set; }
    }
}
