using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Establish
{
    public class CreateImportProductModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public CreateImportProductModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public string UserName { get; set; }
        [BindProperty(SupportsGet = true)] public DateTime? DateImport { get; set; }
        [BindProperty(SupportsGet = true)] public decimal? TotalBill { get; set; }
        [BindProperty(SupportsGet = true)] public int? Supplier { get; set; }
        [BindProperty(SupportsGet = true)] public string? CodeImport { get; set; }
        [BindProperty(SupportsGet = true)] public ImportProduct ImportProduct { get; set; }
        public async Task<IActionResult> OnGetCreate()
        {
            var b = new Models.ImportProduct { UserName = UserName, DateImport=DateImport,TotalBill=TotalBill, Supplier=Supplier, CodeImport=CodeImport };
            if (b != null)
            {
                ImportProduct = b;
                dbContext.ImportProducts.Add(ImportProduct);
                dbContext.SaveChanges();
                int idImportProduct = ImportProduct.Id;

                return new JsonResult(idImportProduct);
            }
            return new JsonResult("error");
        }
    }
}
