using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Customer
{
    public class DetailModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public Models.Customer Cus { get; set; }
        public DetailModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<IActionResult> OnGet(int? id)
        {

            if (id == null || dbContext.Customers == null)
            {
                return NotFound();
            }

            var c = dbContext.Customers.FirstOrDefault(m => m.Id == id);
            if (c == null)
            {
                return NotFound();
            }
            else
            {
                Cus = c;
            }
            return Page();

        }
    }
}
