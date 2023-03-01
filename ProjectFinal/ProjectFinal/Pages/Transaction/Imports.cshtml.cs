using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Transaction
{
    public class ImportsModel : PageModel
    {
        public Models.ImportProduct importProduct { get; set; }
        public readonly MWMSystemContext dbContext;

        public ImportsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        //public List<dynamic> GetAllProductOfSettingPrice()
        //{
        //    var query = (from a in dbContext.Users
        //                 join b in dbContext.ImportProducts on a.Username equals b.UserName
        //                 join c in dbContext.InforImports on b.Id equals c.Idimport
        //                 group new { a, b, c} by new { a.Name, a.Username, b.Id, c.DateImport  } into g
        //                 orderby g.Key.Id
        //                 select new
        //                 {

        //                     g.Key.Id,
        //                     g.Key.Name,
        //                     g.Key.Producer,
        //                     g.Key.Status,
        //                     g.Key.Unit,
        //                     g.Key.SalePrice
        //                 });

        //    List<dynamic> dynamicList = new List<dynamic>();
        //    foreach (var obj in query)
        //    {
        //        dynamic dynamicObj = new System.Dynamic.ExpandoObject();

        //        // Thêm từng thuộc tính vào đối tượng động
        //        dynamicObj.Id = obj.Id;
        //        dynamicObj.Name = obj.Name;
        //        dynamicObj.Producer = obj.Producer;
        //        dynamicObj.Status = obj.Status;
        //        dynamicObj.Unit = obj.Unit;
        //        dynamicObj.SalePrice = obj.SalePrice;

        //        dynamicList.Add(dynamicObj);
        //    }
        //    return dynamicList;
        //}
        public void OnGet()
        {
            // Thực hiện các hoạt động khi người dùng truy cập trang Razor Pages
        }

        public void OnPost()
        {
            // Thực hiện các hoạt động khi người dùng thực hiện POST request tới trang Razor Pages
        }
        //public List<dynamic> GetAllProductOfSettingPrice()
        //{
        //    var query = (from a in dbContext.Products
        //                 join b in dbContext.InformationProducts on a.Id equals b.ProductId
        //                 group new { a, b } by new { a.Id, a.Name, a.Producer, a.Status, a.Unit, b.SalePrice } into g
        //                 orderby g.Key.Id
        //                 select new
        //                 {

        //                     g.Key.Id,
        //                     g.Key.Name,
        //                     g.Key.Producer,
        //                     g.Key.Status,
        //                     g.Key.Unit,
        //                     g.Key.SalePrice
        //                 });

        //    List<dynamic> dynamicList = new List<dynamic>();
        //    foreach (var obj in query)
        //    {
        //        dynamic dynamicObj = new ExpandoObject();

        //        // Thêm từng thuộc tính vào đối tượng động
        //        dynamicObj.Id = obj.Id;
        //        dynamicObj.Name = obj.Name;
        //        dynamicObj.Producer = obj.Producer;
        //        dynamicObj.Status = obj.Status;
        //        dynamicObj.Unit = obj.Unit;
        //        dynamicObj.SalePrice = obj.SalePrice;

        //        dynamicList.Add(dynamicObj);
        //    }
        //    return dynamicList;
        //}
    }
}
