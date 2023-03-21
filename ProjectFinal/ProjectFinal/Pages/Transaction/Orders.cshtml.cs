using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Transaction
{
    public class OrdersModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public const int ITEMS_PER_PAGE = 10;
        [BindProperty(SupportsGet = true, Name = "p")]
        public int currentPage { get; set; }
        public int countPages { get; set; }
        public List<Models.Billed> Orders { get; set; }
        public List<Models.Customer> Customers { get; set; }
        public List<Models.User> Users { get; set; }
        public OrdersModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)]
        public string searchString { get; set; }
        public void OnGet()
        {
            Customers = dbContext.Customers.ToList();
            Users = dbContext.Users.ToList();
            int totalOrders = dbContext.Billeds.Where(o => o.Status==false).Count();
            countPages = (int)Math.Ceiling((double)totalOrders / ITEMS_PER_PAGE);

            if (currentPage < 1)
            {
                currentPage = 1;
            }
            if (currentPage > countPages)
            {
                currentPage = countPages;
            }

            var b = (from a in dbContext.Billeds
                       where a.Status == false 
                       orderby a.Id ascending
                       select a)
                       .Skip((currentPage - 1) * 10)
                       .Take(ITEMS_PER_PAGE);

            if (!string.IsNullOrEmpty(searchString))
            {
                Orders = b.Where(a => a.IdcustomerNavigation.Name.Contains(searchString)).ToList();
            }
            else
            {
                Orders = b.ToList();
            }

        }
    }
}