using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Establish
{
    public class ImportProductsModel : PageModel
    {

        public readonly MWMSystemContext dbContext;
        public ImportProductsModel(MWMSystemContext context)
        {
            dbContext = context;
        }
        public ImportProduct ImportProduct { get; set; }
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
        public IActionResult OnGetProduct(int id)
        {
            var product = dbContext.Products.SingleOrDefault(p => p.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            return new JsonResult(product);
        }
    }
}
