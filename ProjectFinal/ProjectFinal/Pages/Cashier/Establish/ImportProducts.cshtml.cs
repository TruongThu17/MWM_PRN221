using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Cashier.Establish
{
    public class ImportProductsModel : PageModel
    {

        public readonly MWMSystemContext dbContext;
        public ImportProductsModel(MWMSystemContext context)
        {
            dbContext = context;
        }
        [BindProperty(SupportsGet = true)]
        public ImportProduct ImportProduct { get; set; }
        [BindProperty(SupportsGet = true)]
        public InforImport InforImport { get; set; }

        [BindProperty(SupportsGet =true)]
        public List<Product> Products { get; set; }

        [BindProperty(SupportsGet = true)]
        public Product[] productImports { get; set; }


        public void OnGet()
        {
            var pro = dbContext.Products.ToList();
            Products = pro;
        }
       
    }
}
