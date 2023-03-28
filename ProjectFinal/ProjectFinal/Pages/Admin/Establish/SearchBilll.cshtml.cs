using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Models;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace ProjectFinal.Pages.Admin.Establish
{
    public class SearchBilllModel : PageModel
    {

        public readonly MWMSystemContext dbContext;
        public SearchBilllModel(MWMSystemContext context)
        {
            dbContext = context;
        }
        [BindProperty(SupportsGet = true)]
        public Billed Billeds { get; set; }
        [BindProperty(SupportsGet = true)]
        public List<Product> Products { get; set; }
        public IActionResult OnGetSearch(int query)
        {
            var billeds = dbContext.Billeds.Include(b => b.IdcustomerNavigation).FirstOrDefault(p => p.Id == query);
            if (billeds != null)
            {
                var options = new JsonSerializerOptions
                {
                    ReferenceHandler = ReferenceHandler.Preserve
                };
                return new JsonResult(billeds, options);
            }
            return new JsonResult("error");

        }

        public IActionResult OnGetProduct(int query)
        {
            var products = dbContext.ProductsInBills.Where(b => b.Idbill == query).ToList();
            if (products != null)
            {
                return new JsonResult(products);
            }
            return new JsonResult("error");

        }
        public IActionResult OnGetSearchReturnImport(int query)
        {
            var returnimport = dbContext.ImportProducts.Include(b => b.SupplierNavigation).FirstOrDefault(p => p.Id == query);
            if (returnimport != null)
            {
                var options = new JsonSerializerOptions
                {
                    ReferenceHandler = ReferenceHandler.Preserve
                };
                return new JsonResult(returnimport, options);
            }
            return new JsonResult("error");

        }
        public IActionResult OnGetProductImport(int query)
        {
            var products = dbContext.InforImports.Where(b => b.Idimport == query).ToList();
            if (products != null)
            {
                return new JsonResult(products);
            }
            return new JsonResult("error");

        }
    }
}