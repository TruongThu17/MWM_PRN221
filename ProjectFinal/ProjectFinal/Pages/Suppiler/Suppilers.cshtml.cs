using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Suppiler
{
    public class SuppilersModel : PageModel
    {
        public Supplier suppiler { get; set; }
        public readonly MWMSystemContext dbContext;
        public SuppilersModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public void OnGet()
        {
        }
    }
}
