using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Transaction
{
    public class BillsModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public const int ITEMS_PER_PAGE = 10;
        [BindProperty(SupportsGet = true, Name = "p")]
        public int currentPage { get; set; }
        public int countPages { get; set; }
        public List<Models.Billed> Billeds { get; set; }
        public List<Models.Customer> Customers { get; set; }
        public List<Models.User> Users { get; set; }

        public BillsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)]
        public string searchString { get; set; }
        public void OnGet()
        {
            int totalBilleds = (from a in dbContext.Billeds
                               where a.Status == true
                               select a).Count();
            countPages = (int)Math.Ceiling((double)totalBilleds / ITEMS_PER_PAGE);
            if (currentPage < 1)
            {
                currentPage = 1;
            }
            if (currentPage > countPages)
            {
                currentPage = countPages;
            }
            Console.WriteLine(totalBilleds);

            var b = (from a in dbContext.Billeds
                     where a.Status ==true
                     orderby a.Id ascending
                       select a)
                       .Skip((currentPage - 1) * 10)
                       .Take(ITEMS_PER_PAGE);

            if (!string.IsNullOrEmpty(searchString))
            {
                Billeds = b.Where(a => a.IdcustomerNavigation.Name.Contains(searchString)).ToList();
            }
            else
            {
                Billeds = b.ToList();
            }
            Customers = dbContext.Customers.ToList();
            Users = dbContext.Users.ToList();

        }
    }
}

