using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Customer
{
    public class CustomersModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public const int ITEMS_PER_PAGE = 10;
        [BindProperty(SupportsGet = true, Name = "p")]
        public int currentPage { get; set; }
        public int countPages { get; set; }
        public List<Models.Customer> Customers { get; set; }
        public CustomersModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)]
        public string searchString { get; set; }
        public void OnGet()
        {
            int totalCustomer = dbContext.Customers.Count();
            countPages = (int)Math.Ceiling((double)totalCustomer / ITEMS_PER_PAGE);

            if (currentPage < 1)
            {
                currentPage = 1;
            }
            if (currentPage > countPages)
            {
                currentPage = countPages;
            }

            var cus = (from a in dbContext.Customers
                       orderby a.Id ascending
                       select a)
                       .Skip((currentPage - 1) * 10)
                       .Take(ITEMS_PER_PAGE);

            if (!string.IsNullOrEmpty(searchString))
            {
                Customers = cus.Where(a => a.Name.Contains(searchString)).ToList();
            }
            else
            {
                Customers = cus.ToList();
            }

        }
    }
}
