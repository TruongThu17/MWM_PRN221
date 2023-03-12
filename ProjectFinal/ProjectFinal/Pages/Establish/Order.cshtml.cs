using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Establish
{
    public class OrderModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public OrderModel(MWMSystemContext context)
        {
            dbContext = context;
        }
        public void OnGet()
        {
        }
    }
}
