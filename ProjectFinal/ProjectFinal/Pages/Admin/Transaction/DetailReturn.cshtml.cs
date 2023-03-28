using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Transaction
{
    public class DetailReturnModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        [BindProperty(SupportsGet = true)]
        public Return Return { get; set; }
        [BindProperty(SupportsGet = true)]
        public List<ProductsReturn> ProductsReturns { get; set; }
        public DetailReturnModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<IActionResult> OnGet(int? id)
        {

            if (id == null)
            {
                return NotFound();
            }

            Return = await dbContext.Returns
                .Include(b => b.IdcustomerNavigation)
                .Include(b => b.UsernameNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (ProductsReturns == null)
            {
                return NotFound();
            }

            ProductsReturns = await dbContext.ProductsReturns.Include(p => p.Id.IdproductNavigation).Where(p => p.Idreturn == id).ToListAsync();

            return Page();

        }
    }
}
