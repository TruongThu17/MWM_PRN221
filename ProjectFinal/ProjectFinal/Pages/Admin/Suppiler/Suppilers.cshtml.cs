using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Suppiler
{
    public class SuppilersModel : PageModel
    {
        public readonly MWMSystemContext dbContext;
        public const int ITEMS_PER_PAGE = 10;
        [BindProperty(SupportsGet =true, Name ="p")]
        public int currentPage { get; set; }
        public int countPages { get; set; }
        public List<Models.Supplier> Suppliers { get; set; }
        public SuppilersModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet =true)]
        public string searchString { get; set; }
        public void OnGet()
        {
            int totalSupplier = dbContext.Suppliers.Count();
            countPages = (int) Math.Ceiling((double)totalSupplier / ITEMS_PER_PAGE);

            if (currentPage < 1)
            {
                currentPage = 1;
            }
            if (currentPage > countPages)
            {
                currentPage = countPages;
            }

            var sup = (from a in dbContext.Suppliers
                       orderby a.Id ascending
                       select a)
                       .Skip((currentPage - 1) * 10)
                       .Take(ITEMS_PER_PAGE);

            if (!string.IsNullOrEmpty(searchString))
            {
                Suppliers = sup.Where(a => a.Name.Contains(searchString)).ToList();
            }
            else
            {
                Suppliers = sup.ToList();
            }

        }
    }
}
