using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Cashier.Establish
{
    public class CreateInforImportProductModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public CreateInforImportProductModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public int Idimport { get; set; }
        [BindProperty(SupportsGet = true)] public int Idproduct { get; set; }
        [BindProperty(SupportsGet = true)] public decimal ImportPrice { get; set; }
        [BindProperty(SupportsGet = true)] public DateTime DateExpiry { get; set; }
        [BindProperty(SupportsGet = true)] public double Discount { get; set; }
        [BindProperty(SupportsGet = true)] public int SupplierId { get; set; }
        [BindProperty(SupportsGet = true)] public DateTime DateImport { get; set; }
        [BindProperty(SupportsGet = true)] public int QuantityImport { get; set; }
        [BindProperty(SupportsGet = true)] public string Shelves { get; set; }
        [BindProperty(SupportsGet = true)] public InforImport InforImport { get; set; }

        public async Task<IActionResult> OnGetCreate()
        {
            var b = new Models.InforImport { Idimport=Idimport, Idproduct=Idproduct, ImportPrice=ImportPrice,
                                            DateExpiry=DateExpiry,Discount=Discount,SupplierId =SupplierId, DateImport=DateImport,
                                            QuantityImport=QuantityImport,Shelves=Shelves};
            if (b != null)
            {
                InforImport = b;
                dbContext.InforImports.Add(InforImport);
                dbContext.SaveChanges();
                return new JsonResult("success");
            }
            return new JsonResult("error");
        }
    }
}
