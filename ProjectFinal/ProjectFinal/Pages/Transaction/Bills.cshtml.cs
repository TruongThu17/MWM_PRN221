using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Transaction
{
    public class BillsModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public BillsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public void OnGet()
        {
        }
    }
}
