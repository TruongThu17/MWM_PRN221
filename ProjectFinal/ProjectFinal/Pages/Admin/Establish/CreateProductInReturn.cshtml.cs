using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Establish
{
    public class CreateProductInReturnModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public CreateProductInReturnModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public int idR { get; set; }
        [BindProperty(SupportsGet = true)] public int idP { get; set; }
        [BindProperty(SupportsGet = true)] public int idB { get; set; }
        [BindProperty(SupportsGet = true)] public int Price { get; set; }
        [BindProperty(SupportsGet = true)] public int Quatity { get; set; }
        [BindProperty(SupportsGet = true)] public ProductsReturn ProductsReturn { get; set; }
        public async Task<IActionResult> OnGet()
        {
            var b = new Models.ProductsReturn { Idbill = idB, Idproduct = idP, Idreturn = idR, Price = Price, Quantity = Quatity };
            if (b != null)
            {
                ProductsReturn = b;
                dbContext.ProductsReturns.Add(ProductsReturn);
                dbContext.SaveChanges();
                return new JsonResult("ok");
            }
            return new JsonResult("error");
        }

    }
}
