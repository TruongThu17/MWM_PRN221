using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Managerment
{
    public class UpdateProductsModel : PageModel
    {
        private readonly MWMSystemContext _context;

        public UpdateProductsModel(MWMSystemContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Product Product { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var p = await _context.Products.FirstOrDefaultAsync(m => m.Id == id);
            if (p == null)
            {
                return NotFound();
            }
            Product = p;
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {

            //if (!ModelState.IsValid)
            //{
            //    return Page();
            //}

            _context.Attach(Product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProExists(Product.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Products");
        }

        private bool ProExists(int id)
        {
            return _context.Products.Any(e => e.Id == id);
        }
    }
}
