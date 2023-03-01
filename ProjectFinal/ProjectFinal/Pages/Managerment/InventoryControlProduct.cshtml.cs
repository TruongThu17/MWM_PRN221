using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Managerment
{
    public class InventoryControlProductModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public InventoryControlProductModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public List<dynamic> GetAllProductOfInventoryControl()
        {
            var query = (from a in dbContext.InforImports
                         join b in dbContext.Products on a.Idproduct equals b.Id
                         group new { a, b } by new { a.Idproduct, b.Name, b.Producer,
                             a.DateExpiry, a.DateImport,b.SalePrice,b.Status, a.ImportPrice,b.Unit,a.Discount, a.QuantityImport, b.QuantityInStock, a.Shelves} into g
                         orderby g.Key.Idproduct
                         select new
                         {

                             g.Key.Idproduct,
                             g.Key.Name,
                             g.Key.Producer,
                             g.Key.DateExpiry,
                             g.Key.DateImport,
                             g.Key.SalePrice,
                             g.Key.Unit,
                             g.Key.ImportPrice,
                             g.Key.QuantityImport,
                             g.Key.QuantityInStock,
                             g.Key.Status,
                             g.Key.Shelves,
                             g.Key.Discount
                         });

            List<dynamic> dynamicList = new List<dynamic>();
            foreach (var obj in query)
            {
                dynamic dynamicObj = new System.Dynamic.ExpandoObject();

                // Thêm từng thuộc tính vào đối tượng động
                dynamicObj.Idproduct = obj.Idproduct;
                dynamicObj.Name = obj.Name;
                dynamicObj.Producer = obj.Producer;
                dynamicObj.DateExpiry = obj.DateExpiry;
                dynamicObj.DateImport = obj.DateImport;
                dynamicObj.SalePrice = obj.SalePrice;
                dynamicObj.Unit = obj.Unit;
                dynamicObj.ImportPrice = obj.ImportPrice;
                dynamicObj.QuantityImport = obj.QuantityImport;
                dynamicObj.QuantityInStock = obj.QuantityInStock;
                dynamicObj.Shelves = obj.Shelves;
                dynamicObj.Status = obj.Status;
                dynamicObj.Discount = obj.Discount;
                dynamicList.Add(dynamicObj);
            }
            return dynamicList;
        }
        public void OnGet()
        {

        }
    }
}
