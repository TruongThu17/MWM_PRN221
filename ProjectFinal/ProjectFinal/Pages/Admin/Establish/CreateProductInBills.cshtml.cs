using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Establish
{
    public class CreateProductInBillsModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public CreateProductInBillsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public int IDBill { get; set; }
        [BindProperty(SupportsGet = true)] public int IDProduct { get; set; }
        [BindProperty(SupportsGet = true)] public int Quantity { get; set; }
        [BindProperty(SupportsGet = true)] public decimal Price { get; set; }
        [BindProperty(SupportsGet = true)] public ProductsInBill ProductsInBill { get; set; }
        public async Task<IActionResult> OnGet()
        {
            var b = new Models.ProductsInBill {Idbill =IDBill, Idproduct =IDProduct, Quatity =Quantity, Price =Price };
            if (b != null)
            {
                ProductsInBill = b;
                dbContext.ProductsInBills.Add(ProductsInBill);
                dbContext.SaveChanges();
                return new JsonResult("ok");
            }
            return new JsonResult("error");
        }
    }
}
