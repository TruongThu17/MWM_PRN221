using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Managerment
{
    public class ProductsModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public const int ITEMS_PER_PAGE = 10;
        [BindProperty(SupportsGet = true, Name = "p")]
        public int currentPage { get; set; }
        public int countPages { get; set; }
        public List<Models.Product> Products { get; set; }
        public List<Models.ProductType> ProductTypes { get; set; }
        public ProductsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)]
        public string searchString { get; set; }
        public void OnGet()
        {
            int totalProduct = dbContext.Products.Count();
            countPages = (int)Math.Ceiling((double)totalProduct / ITEMS_PER_PAGE);

            if (currentPage < 1)
            {
                currentPage = 1;
            }
            if (currentPage > countPages)
            {
                currentPage = countPages;
            }

            var pro = (from a in dbContext.Products
                       orderby a.Id ascending
                       select a)
                       .Skip((currentPage - 1) * 10)
                       .Take(ITEMS_PER_PAGE);

            if (!string.IsNullOrEmpty(searchString))
            {
                Products = pro.Where(a => a.Name.Contains(searchString)).ToList();
            }
            else
            {
                Products = pro.ToList();
            }

        }
    }
}