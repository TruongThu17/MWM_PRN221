using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace ProjectFinal.Pages.Suppiler
{
    public class CreateModel : PageModel
    {
        public void OnGet()
        {
        }

        public IActionResult OnPost(string name, string email, string phone, string address)
        {
            return new JsonResult("success");
        }
    }
}
