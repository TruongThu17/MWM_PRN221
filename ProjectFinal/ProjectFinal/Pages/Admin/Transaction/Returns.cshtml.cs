using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Transaction
{
    public class ReturnsModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public const int ITEMS_PER_PAGE = 10;
        [BindProperty(SupportsGet = true, Name = "p")]
        public int currentPage { get; set; }
        public int countPages { get; set; }
        public List<Models.Return> Returns { get; set; }
        public List<Models.Customer> Customers { get; set; }
        public List<Models.User> Users { get; set; }

        public ReturnsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)]
        public string searchString { get; set; }
        public void OnGet()
        {
            int totalReturns = (from a in dbContext.Returns
                                             select a).Count();
            countPages = (int)Math.Ceiling((double)totalReturns / ITEMS_PER_PAGE);
            if (currentPage < 1)
            {
                currentPage = 1;
            }
            if (currentPage > countPages)
            {
                currentPage = countPages;
            }
            Console.WriteLine(totalReturns);

            var b = (from a in dbContext.Returns
                     orderby a.Id ascending
                     select a)
                       .Skip((currentPage - 1) * 10)
                       .Take(ITEMS_PER_PAGE);

            if (!string.IsNullOrEmpty(searchString))
            {
                Returns = b.Where(a => a.IdcustomerNavigation.Name.Contains(searchString)).ToList();
            }
            else
            {
                Returns = b.ToList();
            }
            Customers = dbContext.Customers.ToList();
            Users = dbContext.Users.ToList();

        }
    }
}


