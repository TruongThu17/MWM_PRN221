using System;
using System.Collections.Generic;

namespace ProjectFinal.Models
{
    public partial class Customer
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? Note { get; set; }
    }
}
