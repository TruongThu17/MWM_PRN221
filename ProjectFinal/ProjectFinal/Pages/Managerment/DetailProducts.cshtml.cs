using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Managerment
{
    public class DetailProductsModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public Product Product { get; set; }
        public DetailProductsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<IActionResult> OnGet(int? id)
        {

            if (id == null || dbContext.Products == null)
            {
                return NotFound();
            }

            var pro = dbContext.Products.FirstOrDefault(m => m.Id == id);
            if (pro == null)
            {
                return NotFound();
            }
            else
            {
                Product = pro;
            }
            return Page();

        }
    }
}

