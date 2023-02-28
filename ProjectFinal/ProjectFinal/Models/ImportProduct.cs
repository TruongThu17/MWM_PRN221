using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class ImportProduct
    {
        public ImportProduct()
        {
            InforImports = new HashSet<InforImport>();
        }

        public int Id { get; set; }
        public string UserName { get; set; } = null!;

        public virtual User UserNameNavigation { get; set; } = null!;
        public virtual ICollection<InforImport> InforImports { get; set; }
    }
}
