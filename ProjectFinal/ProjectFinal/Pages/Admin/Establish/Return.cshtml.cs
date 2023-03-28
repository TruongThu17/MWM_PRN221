using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Establish
{
    public class ReturnModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public ReturnModel(MWMSystemContext context)
        {
            dbContext = context;
        }
    }
}
