using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Establish
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
        public IActionResult OnGetSearch(string query)
        {
            var customers = dbContext.Customers.Where(p => p.Name.Contains(query)).ToList();
            Customers = customers;
            return new JsonResult(Customers);
        }
    }
}
