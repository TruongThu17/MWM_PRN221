using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.DataService;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Cashier
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        public readonly MWMSystemContext dbContext;
        private readonly Author author;

        public List<User> Users { get; set; }

        public int countSupplier { get; set; }

        public int countCustomer { get; set; }
        public Billed billed { get; set; }
        public int[] ChartBoard2 { get; set; }
        public IndexModel(ILogger<IndexModel> logger, MWMSystemContext dbContext, Author _author)
        {
            _logger = logger;
            this.dbContext = dbContext;
            author = _author;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            //author
            if (!author.IsAuthor(2))
            {
                return RedirectToPage("~/404");
            }

            return Page();
        }
       
    }
}