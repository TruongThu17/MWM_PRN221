using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Suppiler
{
    public class CreateModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public CreateModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public string name { get; set; }
        [BindProperty(SupportsGet = true)] public string email { get; set; }
        [BindProperty(SupportsGet = true)] public string phone { get; set; }
        [BindProperty(SupportsGet = true)] public string address { get; set; }

        public IActionResult OnGet()
        {
            var newSuppiler = new Supplier { Name = name, Email = email, Phone = phone, Address = address };
            dbContext.Suppliers.Add(newSuppiler);
            dbContext.SaveChanges();
            return new JsonResult("success");
        }

        public IActionResult OnPost(string name, string email, string phone, string address)
        {
            return new JsonResult("success");
        }
    }
}
