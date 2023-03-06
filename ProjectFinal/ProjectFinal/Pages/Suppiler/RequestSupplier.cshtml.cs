using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;


namespace ProjectFinal.Pages.Suppiler
{
    public class RequestSupplierModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public List<Supplier> listSuppilers { get; set; }
        public RequestSupplierModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public string name { get; set; }
        [BindProperty(SupportsGet = true)] public string email { get; set; }
        [BindProperty(SupportsGet = true)] public string phone { get; set; }
        [BindProperty(SupportsGet = true)] public string address { get; set; }

        public IActionResult OnGetCreate()
        {
            var newSuppiler = new Supplier { Name = name, Email = email, Phone = phone, Address = address };
            dbContext.Suppliers.Add(newSuppiler);
            dbContext.SaveChanges();
            return new JsonResult("success");
        }
        //public void OnGet(string searchString)
        //{
        //    if (!string.IsNullOrEmpty(searchString))
        //    {
        //        listSuppilers = dbContext.Suppliers
        //            .Where(dt => dt.Name.Contains(searchString))
        //            .ToList();
        //    }
        //}
    }
}
