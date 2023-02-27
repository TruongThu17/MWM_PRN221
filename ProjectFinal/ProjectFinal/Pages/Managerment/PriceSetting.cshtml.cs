using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;
using System.Dynamic;

namespace ProjectFinal.Pages.Managerment
{
    public class PriceSettingModel : PageModel
    {
        public InformationProduct inforProduct { get; set; }
        public readonly MWMSystemContext dbContext;

        public PriceSettingModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public List<dynamic> GetAllProductOfSettingPrice()
        {
            var query = (from a in dbContext.Products
                        join b in dbContext.InformationProducts on a.Id equals b.ProductId
                         group new { a, b } by new { a.Id, a.Name, a.Producer, a.Status, a.Unit, b.SalePrice } into g
                        orderby g.Key.Id
                        select new
                        {

                            g.Key.Id,
                            g.Key.Name,
                            g.Key.Producer,
                            g.Key.Status,
                            g.Key.Unit,
                            g.Key.SalePrice
                        });

            List<dynamic> dynamicList = new List<dynamic>();
            foreach (var obj in query)
            {
                dynamic dynamicObj = new ExpandoObject();

                // Thêm từng thuộc tính vào đối tượng động
                dynamicObj.Id = obj.Id;
                dynamicObj.Name = obj.Name;
                dynamicObj.Producer = obj.Producer;
                dynamicObj.Status = obj.Status;
                dynamicObj.Unit = obj.Unit;
                dynamicObj.SalePrice = obj.SalePrice;

                dynamicList.Add(dynamicObj);
            }
            return dynamicList;
        }
        public void OnGet()
        {
        }
    }
}
