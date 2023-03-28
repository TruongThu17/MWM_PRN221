using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Managerment
{
    public class UpdateInventoryModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public InforImport InforImport { get; set; }
        public Product Product { get; set; }
        public Supplier Suppiler { get; set; }
        public ProductType ProductType { get; set; }
        public UpdateInventoryModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<IActionResult> OnGet(int? id)
        {

            if (id == null || dbContext.InforImports == null)
            {
                return NotFound();
            }

            var infor = dbContext.InforImports.FirstOrDefault(m => m.Idimport == id);

            if (infor == null)
            {
                return NotFound();
            }
            else
            {
                InforImport = infor;
                var pro = dbContext.Products.FirstOrDefault(m => m.Id == InforImport.Idproduct);

                Product = pro;
                var sup = dbContext.Suppliers.FirstOrDefault(m => m.Id == InforImport.SupplierId);
                Suppiler = sup;

                var pt = dbContext.ProductTypes.FirstOrDefault(m => m.Id == Product.ProductType);
                ProductType = pt;

            }
            return Page();

        }
    }
}
