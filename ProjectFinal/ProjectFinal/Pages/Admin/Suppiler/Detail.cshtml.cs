using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Suppiler
{
    public class DetailModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public Supplier Supp { get; set; }
        public DetailModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<IActionResult> OnGet(int? id)
        {

            if (id == null || dbContext.Suppliers == null)
            {
                return NotFound();
            }

            var sup =  dbContext.Suppliers.FirstOrDefault(m => m.Id == id);
            if (sup == null)
            {
                return NotFound();
            }
            else
            {
                Supp = sup;
            }
            return Page();

        }
    }
}
