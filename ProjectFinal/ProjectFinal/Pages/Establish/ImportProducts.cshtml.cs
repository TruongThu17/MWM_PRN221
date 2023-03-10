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
        public Product Product { get; set; }
        public Supplier Suppiler { get; set; }
        public List<Models.Supplier> Suppliers { get; set; }
        public void OnGet()
        {

        }
    }
}
