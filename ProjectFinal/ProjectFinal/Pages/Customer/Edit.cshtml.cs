using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Customer
{
    public class EditModel : PageModel
    {
        private readonly MWMSystemContext _context;

        public EditModel(MWMSystemContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Models.Customer Customer { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Customers == null)
            {
                return NotFound();
            }

            var c = await _context.Customers.FirstOrDefaultAsync(m => m.Id == id);
            if (c == null)
            {
                return NotFound();
            }
            Customer = c;
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {

            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(Customer).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CusExists(Customer.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Customers");
        }

        private bool CusExists(int id)
        {
            return _context.Customers.Any(e => e.Id == id);
        }
    }
}
