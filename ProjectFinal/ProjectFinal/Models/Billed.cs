using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class Billed
    {
        public int Id { get; set; }
        public string Username { get; set; } = null!;
        public DateTime? DateImport { get; set; }
        public int Idcustomer { get; set; }
        public decimal? TotalBill { get; set; }
        public decimal? Debt { get; set; }
        public decimal? Deposit { get; set; }
        public bool? Status { get; set; }

        public virtual Customer IdcustomerNavigation { get; set; } = null!;
        public virtual User UsernameNavigation { get; set; } = null!;
    }
}
