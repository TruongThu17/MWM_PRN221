using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Cashier.Establish
{
    public class CreateReturnModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public CreateReturnModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public int id { get; set; }
        [BindProperty(SupportsGet = true)] public decimal total { get; set; }
        [BindProperty(SupportsGet = true)] public Return Return { get; set; }
        public async Task<IActionResult> OnGetCreate()
        {
            var i = dbContext.Billeds.FirstOrDefault(i=>i.Id==id);
            var b = new Models.Return { Idbill = id, Username = "thutt", Idcustomer = i.Idcustomer, Date = DateTime.Now, Totalbill= total};
            if (b != null)
            {
                Return = b;
                dbContext.Returns.Add(Return);
                dbContext.SaveChanges();
                int idReturn  = Return.Id;
                return new JsonResult(idReturn);
            }
            return new JsonResult("error");
        }
    }
}
