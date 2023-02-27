using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class Product
    {
        public Product()
        {
            InformationProducts = new HashSet<InformationProduct>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Producer { get; set; }
        public int ProductType { get; set; }
        public bool Status { get; set; }
        public string? Unit { get; set; }

        public virtual ProductType ProductTypeNavigation { get; set; } = null!;
        public virtual ICollection<InformationProduct> InformationProducts { get; set; }
    }
}
