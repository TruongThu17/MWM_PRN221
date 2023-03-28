using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.DataService;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin
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

        [BindProperty(SupportsGet = true)]
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
            if (!author.IsAuthor(1))
            {
                return RedirectToPage("~/404");
            }
            countCustomer = dbContext.Customers.Count();
            countSupplier = dbContext.Suppliers.Count();
            Users = dbContext.Users.ToList();

            var list = ChartBoard2.ToList();
            for (int i = 1; i < 13; i++)
            {
                list.Add((int) GetTotalByMonth(i, DateTime.Now.Year));
            }
            ChartBoard2 = list.ToArray();
            return Page();
        }
        public decimal GetTotalByMonth(int month, int year)
        {
            return dbContext.Billeds.Where(b => b.DateImport.Month == month && b.DateImport.Year == year && b.Status == true).Count();
        }
        public decimal GetTotalByYear(int year)
        {
            return dbContext.Billeds.Where(b => b.DateImport.Year == year && b.Status == true).Count();
        }
        public decimal GetTotalBillInYear(int year)
        {
            return (decimal)dbContext.Billeds.Where(b => b.DateImport.Year == year && b.Status == true).Sum(s => s.TotalBill);
        }
        public decimal GetTotalBillInmonth(int month, int year)
        {
            decimal m = (decimal)dbContext.Billeds.Where(b => b.DateImport.Month == month && b.DateImport.Year == year && b.Status == true).Sum(s => s.TotalBill);
            decimal y = (decimal)dbContext.Billeds.Where(b => b.DateImport.Year == year && b.Status == true).Sum(s => s.TotalBill);
            decimal t = m / y * 100;
            return t;
        }
        public decimal GetTotalByToDay()
        {
            return (decimal)dbContext.Billeds.Where(b => b.DateImport.Day == DateTime.Today.Day && b.DateImport.Year == DateTime.Today.Year && b.Status == true).Sum(s => s.TotalBill);
        }
        public decimal GetTotalByMonth()
        {
            return (decimal)dbContext.Billeds.Where(b => b.DateImport.Month == DateTime.Today.Month && b.DateImport.Year == DateTime.Today.Year && b.Status == true).Sum(s => s.TotalBill);
        }
    }
}