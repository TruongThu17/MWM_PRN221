using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Establish
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
    }
}
