using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Customer
{
    public class CreateModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public List<Models.Customer> listCustomers { get; set; }
        public CreateModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public string name { get; set; }
        [BindProperty(SupportsGet = true)] public string phone { get; set; }
        [BindProperty(SupportsGet = true)] public string address { get; set; }
        [BindProperty(SupportsGet = true)] public string note { get; set; }
        public IActionResult OnGetCreate()
        {
            var newCustomer = new Models.Customer { Name = name, Phone = phone, Address = address, Note = note };
            dbContext.Customers.Add(newCustomer);
            dbContext.SaveChanges();
            return new JsonResult("success");
        }
    }
}
