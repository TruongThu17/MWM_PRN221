using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Transaction
{
    public class DetailImportModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        [BindProperty(SupportsGet = true)]
        public ImportProduct ImportProduct { get; set; }
        [BindProperty(SupportsGet = true)]
        public List<InforImport> InforImports { get; set; }
        public DetailImportModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<IActionResult> OnGet(int? id)
        {

            if (id == null)
            {
                return NotFound();
            }

            ImportProduct = await dbContext.ImportProducts
                .Include(b => b.SupplierNavigation)
                .Include(b => b.UserNameNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (ImportProduct == null)
            {
                return NotFound();
            }

            InforImports = await dbContext.InforImports.Include(p => p.IdproductNavigation).Where(p => p.Idimport == id).ToListAsync();

            return Page();

        }
    }
}
