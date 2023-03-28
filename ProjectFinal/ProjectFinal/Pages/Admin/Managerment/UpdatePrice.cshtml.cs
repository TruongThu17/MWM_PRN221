using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Managerment
{
    public class UpdatePriceModel : PageModel
    {
        private readonly MWMSystemContext _context;

        public UpdatePriceModel(MWMSystemContext context)
        {
            _context = context;
        }

        [BindProperty(SupportsGet = true)]
        public int Id { get; set; }

        [BindProperty(SupportsGet = true)]
        public decimal Price { get; set; }

        public Product Product { get; set; }

        public async Task<IActionResult> OnGetAsync()
        {
            Product = await _context.Products.FindAsync(Id);

            if (Product == null)
            {
                return NotFound();
            }

            if (Product.SalePrice != Price)
            {
                Product.SalePrice = Price;
                _context.Products.Update(Product);
                await _context.SaveChangesAsync();
            }

            return new JsonResult("success");
        }
    }
}
