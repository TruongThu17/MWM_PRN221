using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class ReturnImportProduct
    {
        public int Id { get; set; }
        public int? IdimportProduct { get; set; }
        public DateTime? Date { get; set; }
        public decimal? Totalbill { get; set; }
        public string? Username { get; set; }
        public int? Suppiler { get; set; }

        public virtual ImportProduct? IdimportProductNavigation { get; set; }
        public virtual Supplier? SuppilerNavigation { get; set; }
        public virtual User? UsernameNavigation { get; set; }
    }
}
