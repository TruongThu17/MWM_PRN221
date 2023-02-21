using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Customer
{
    public class CustomersModel : PageModel
    {
        public Models.Customer customer { get; set; }
        public readonly MWMSystemContext dbContext;

        public CustomersModel(MWMSystemContext dbContext)
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
