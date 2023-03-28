using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;
using System.Text.Json;

namespace ProjectFinal.Pages
{
    public class IndexModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public IndexModel(MWMSystemContext context)
        {
            dbContext = context;
        }

        [BindProperty]
        public User user { get; set; } = default!;
        public async Task<IActionResult> OnPostAsync()
        {
            User _user = dbContext.Users.FirstOrDefault(u => u.Username == user.Username && u.Password == user.Password);
            if (_user != null)
            {
                HttpContext.Session.SetString("user", JsonSerializer.Serialize(_user));
                switch (_user.Role)
                {
                    case 1:
                        return RedirectToPage("./Admin/Index");
                    case 2:
                        return RedirectToPage("./Cashier/Index");
                        //case 3:
                        //    return RedirectToPage("./WarehouseStaff/Products/Index");
                }

            }
            ModelState.AddModelError("", "Sai tên đăng nhập hoặc mật khẩu");
            return Page();
        }
    }
}
