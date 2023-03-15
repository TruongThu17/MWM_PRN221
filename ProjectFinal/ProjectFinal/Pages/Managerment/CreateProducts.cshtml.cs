using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Managerment
{
    public class CreateProductsModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        //public List<Product> listProducts { get; set; }
        public CreateProductsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }

        [BindProperty(SupportsGet = true)] public string nameProduct { get; set; }
        [BindProperty(SupportsGet = true)] public string nameProducer { get; set; }
        [BindProperty(SupportsGet = true)] public int productype { get; set; }
        [BindProperty(SupportsGet = true)] public bool status { get; set; }
        [BindProperty(SupportsGet = true)] public string unit { get; set; }
        [BindProperty(SupportsGet = true)] public decimal saleprice { get; set; }
        [BindProperty(SupportsGet = true)] public int quantityinstock { get; set; }


        public IActionResult OnGetCreate()
        {
            var newProduct = new Product { Name = nameProduct,Producer = nameProducer, ProductType = productype, Status = status, Unit = unit, SalePrice = saleprice, QuantityInStock = quantityinstock , QuantityOrder=0,QuantitySold=0, TotalSales=0 };
            dbContext.Products.Add(newProduct);
            dbContext.SaveChanges();
            return new JsonResult("success");
        }
    }
}
