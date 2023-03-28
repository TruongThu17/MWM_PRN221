using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Cashier.Establish
{
    public class SearchProductModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public SearchProductModel(MWMSystemContext context)
        {
            dbContext = context;
        }
        [BindProperty(SupportsGet = true)]
        public List<Product> Products { get; set; }
        public IActionResult OnGetSearch(string query)
        {
            //var products = dbContext.Products.ToList();
            var products = dbContext.Products.Where(p => p.Name.Contains(query)).ToList();
            Products = products;
            return new JsonResult(Products);
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
