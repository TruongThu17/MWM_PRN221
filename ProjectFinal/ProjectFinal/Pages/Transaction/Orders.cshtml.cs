using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Transaction
{
    public class OrdersModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public OrdersModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public void OnGet()
        {
        }
    }
}
