using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Transaction
{
    public class DetailReturnImportModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        [BindProperty(SupportsGet = true)]
        public ReturnImportProduct ReturnImportProduct { get; set; }
        [BindProperty(SupportsGet = true)]
        public List<ProductReturnImport> ProductReturnImports { get; set; }
        public DetailReturnImportModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<IActionResult> OnGet(int? id)
        {

            if (id == null)
            {
                return NotFound();
            }

            ReturnImportProduct = await dbContext.ReturnImportProducts
                .Include(b => b.SuppilerNavigation)
                .Include(b => b.UsernameNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (ReturnImportProduct == null)
            {
                return NotFound();
            }

            ProductReturnImports = await dbContext.ProductReturnImports.Include(p => p.Id.IdproductNavigation).Where(p => p.Idreturn == id).ToListAsync();

            return Page();

        }
    }
}
