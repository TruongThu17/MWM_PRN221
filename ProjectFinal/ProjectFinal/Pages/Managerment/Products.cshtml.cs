using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Managerment
{
    public class ProductsModel : PageModel
    {
        public Models.Product product { get; set; }
        public readonly MWMSystemContext dbContext;

        public ProductsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public void OnGet()
        {
            // Thực hiện các hoạt động khi người dùng truy cập trang Razor Pages
        }

        public void OnPost()
        {
            // Thực hiện các hoạt động khi người dùng thực hiện POST request tới trang Razor Pages
        }
    }
}
