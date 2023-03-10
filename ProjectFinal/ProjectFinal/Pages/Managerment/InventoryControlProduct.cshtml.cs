using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Managerment
{
    public class InventoryControlProductModel : PageModel
    {
         public readonly MWMSystemContext dbContext;
        public const int ITEMS_PER_PAGE = 10;
        [BindProperty(SupportsGet = true, Name = "p")]
        public int currentPage { get; set; }
        public int countPages { get; set; }
        public List<Models.Product> Products { get; set; }
        public List<Models.ProductType> ProductTypes { get; set; }
        public List<Models.InforImport> InforImports { get; set; }
        public List<Models.Supplier> Suppliers { get; set; }
        public InventoryControlProductModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)]
        public string searchString { get; set; }
        public void OnGet()
        {
            int totalInforImports = dbContext.InforImports.Count();
            countPages = (int)Math.Ceiling((double)totalInforImports / ITEMS_PER_PAGE);

            if (currentPage < 1)
            {
                currentPage = 1;
            }
            if (currentPage > countPages)
            {
                currentPage = countPages;
            }

            var pro = (from a in dbContext.InforImports
                       orderby a.Idproduct ascending
                       select a)
                       .Skip((currentPage - 1) * 10)
                       .Take(ITEMS_PER_PAGE);


            InforImports = pro.ToList();
            

        }
    }
}
