using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Transaction
{
    public class OrderDetailModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        [BindProperty(SupportsGet = true)]
        public Billed Billed { get; set; }
        [BindProperty(SupportsGet = true)]
        public List<ProductsInBill> Products { get; set; }
        public OrderDetailModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<IActionResult> OnGet(int? id)
        {

            if (id == null)
            {
                return NotFound();
            }

            Billed = await dbContext.Billeds
                .Include(b => b.UsernameNavigation)
                .Include(b => b.IdcustomerNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (Billed == null)
            {
                return NotFound();
            }

            Products = await dbContext.ProductsInBills.Include(p => p.IdproductNavigation).Where(p => p.Idbill == id).ToListAsync();

            return Page();

        }
    }
}
