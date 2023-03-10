using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        public readonly MWMSystemContext dbContext;

        public List<User> Users { get; set; }

        public int countSupplier { get; set; }

        public int countCustomer { get; set; }

        public IndexModel(ILogger<IndexModel> logger, MWMSystemContext dbContext)
        {
            _logger = logger;
            this.dbContext = dbContext;
        }

        public void OnGet()
        {
            countCustomer = dbContext.Customers.Count();
            countSupplier = dbContext.Suppliers.Count();
            Users = dbContext.Users.ToList();
        }
    }
}