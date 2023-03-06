using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Suppiler
{
    public class SuppilersModel : PageModel
    {
        public List<Supplier> listSuppilers { get; set; }
        public readonly MWMSystemContext dbContext;
        public SuppilersModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public void OnGet(string searchString)
        {
            if (!string.IsNullOrEmpty(searchString))
            {
                listSuppilers = dbContext.Suppliers
                    .Where(dt => dt.Name.Contains(searchString))
                    .ToList();
            }
        }
        public IActionResult OnPost(string name, string email, string phone, string address)
        {
            var newSuppiler = new Supplier { Name = name, Email = email, Phone = phone, Address = address };
            dbContext.Suppliers.Add(newSuppiler);
            dbContext.SaveChanges();
            return new JsonResult("success");
        }
    }
}
