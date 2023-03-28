using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Transaction
{
    public class ImportsModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public const int ITEMS_PER_PAGE = 10;
        [BindProperty(SupportsGet = true, Name = "p")]
        public int currentPage { get; set; }
        public int countPages { get; set; }
        public List<Models.ImportProduct> ImportProducts { get; set; }
        public List<Models.Supplier> Suppliers { get; set; }
        public List<Models.User> Users { get; set; }

        public ImportsModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)]
        public string searchString { get; set; }
        public void OnGet()
        {
            int totalImportProducts = (from a in dbContext.ImportProducts
                                select a).Count();
            countPages = (int)Math.Ceiling((double)totalImportProducts / ITEMS_PER_PAGE);
            if (currentPage < 1)
            {
                currentPage = 1;
            }
            if (currentPage > countPages)
            {
                currentPage = countPages;
            }
            Console.WriteLine(totalImportProducts);

            var b = (from a in dbContext.ImportProducts
                     orderby a.Id ascending
                     select a)
                       .Skip((currentPage - 1) * 10)
                       .Take(ITEMS_PER_PAGE);

            if (!string.IsNullOrEmpty(searchString))
            {
                ImportProducts = b.Where(a => a.SupplierNavigation.Name.Contains(searchString)).ToList();
            }
            else
            {
                ImportProducts = b.ToList();
            }
            Suppliers = dbContext.Suppliers.ToList();
            Users = dbContext.Users.ToList();

        }
    }
}


