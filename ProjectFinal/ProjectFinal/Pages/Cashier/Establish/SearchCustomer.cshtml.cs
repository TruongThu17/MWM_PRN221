using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Cashier.Establish
{
    public class SearchCustomerModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public SearchCustomerModel(MWMSystemContext context)
        {
            dbContext = context;
        }
        [BindProperty(SupportsGet = true)]
        public List<Models.Customer> Customers { get; set; }
        [BindProperty(SupportsGet = true)]
        public Models.Customer Customer { get; set; }
        public IActionResult OnGetSearch(string query)
        {
            var customers = dbContext.Customers.Where(p => p.Name.Contains(query)).ToList();
            Customers = customers;
            return new JsonResult(Customers);
        }
        public IActionResult OnGetSearchByID(int id)
        {
            var customer = dbContext.Customers.Where(p => p.Id ==id).FirstOrDefault();
            Customer = customer;
            return new JsonResult(Customer);
        }
    }
}
