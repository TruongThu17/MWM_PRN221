using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Establish
{
    public class CreateReturnImportModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public CreateReturnImportModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public int id { get; set; }
        [BindProperty(SupportsGet = true)] public decimal total { get; set; }
        [BindProperty(SupportsGet = true)] public ReturnImportProduct ReturnImportProduct { get; set; }
        public async Task<IActionResult> OnGetCreate()
        {
            var i = dbContext.ImportProducts.FirstOrDefault(i => i.Id == id);
            var b = new Models.ReturnImportProduct { Idimport = id, Date = DateTime.Now, Totalbill = total, Username = "thutt", Suppiler = i.Supplier};
            if (b != null)
            {
                ReturnImportProduct = b;
                dbContext.ReturnImportProducts.Add(ReturnImportProduct);
                dbContext.SaveChanges();
                int idReturn = ReturnImportProduct.Id;
                return new JsonResult(idReturn);
            }
            return new JsonResult("error");
        }
    }
}
