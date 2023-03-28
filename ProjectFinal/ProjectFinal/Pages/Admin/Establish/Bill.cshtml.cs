using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Establish
{
    public class BillModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public BillModel(MWMSystemContext context)
        {
            dbContext = context;
        }

        public void OnGet()
        {
        }
    }
}
