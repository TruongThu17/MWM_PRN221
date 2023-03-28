using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Cashier.Establish
{
    public class CreateProductReturnImportModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public CreateProductReturnImportModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public int idR { get; set; }
        [BindProperty(SupportsGet = true)] public int idP { get; set; }
        [BindProperty(SupportsGet = true)] public int idI { get; set; }
        [BindProperty(SupportsGet = true)] public int Price { get; set; }
        [BindProperty(SupportsGet = true)] public int Quatity { get; set; }
        [BindProperty(SupportsGet = true)] public ProductReturnImport ProductReturnImport { get; set; }
        public async Task<IActionResult> OnGet()
        {
            var b = new Models.ProductReturnImport { Idimport = idI, Idproduct = idP, Idreturn = idR, Price = Price, Quantity = Quatity };
            if (b != null)
            {
                ProductReturnImport = b;
                dbContext.ProductReturnImports.Add(ProductReturnImport);
                dbContext.SaveChanges();
                return new JsonResult("ok");
            }
            return new JsonResult("error");
        }

    }
}
