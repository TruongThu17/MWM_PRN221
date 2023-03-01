using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        public readonly MWMSystemContext dbContext;

        public IndexModel(ILogger<IndexModel> logger, MWMSystemContext dbContext)
        {
            _logger = logger;
            this.dbContext = dbContext;
        }

        public void OnGet()
        {

        }
    }
}