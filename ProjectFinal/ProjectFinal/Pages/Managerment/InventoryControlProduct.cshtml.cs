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
        public void OnGet()
        {

        }
    }
}
