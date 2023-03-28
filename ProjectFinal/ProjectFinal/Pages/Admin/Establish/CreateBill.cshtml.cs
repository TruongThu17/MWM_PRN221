using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectFinal.Models;

namespace ProjectFinal.Pages.Admin.Establish
{
    public class CreateBillModel : PageModel
    {
        public readonly MWMSystemContext dbContext;

        public CreateBillModel(MWMSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [BindProperty(SupportsGet = true)] public string username { get; set; }
        [BindProperty(SupportsGet = true)] public int customerId { get; set; }
        [BindProperty(SupportsGet = true)] public decimal totalbill { get; set; }
        [BindProperty(SupportsGet = true)] public decimal debt { get; set; }
        [BindProperty(SupportsGet = true)] public decimal deposite { get; set; }
        [BindProperty(SupportsGet = true)] public double discount { get; set; }
        [BindProperty(SupportsGet = true)] public Billed Billed { get; set; }
        public IActionResult OnGetCreate()
        {
            var b = new Models.Billed { Username = username, DateImport = DateTime.Now, Idcustomer = customerId, TotalBill = totalbill , Debt =debt, Deposit =deposite, Discount = discount, Status = false};
            if (b != null)
            {
                Billed = b;
                dbContext.Billeds.Add(Billed);
                dbContext.SaveChanges();
                int idBill = Billed.Id;
                return new JsonResult(idBill);
            }
            return new JsonResult("error");
        }
        public IActionResult OnGetCreateBill()
        {
            var b = new Models.Billed { Username = username, DateImport = DateTime.Now, Idcustomer = customerId, TotalBill = totalbill, Debt = 0, Deposit = deposite, Discount = discount, Status = true };
            if (b != null)
            {
                Billed = b;
                dbContext.Billeds.Add(Billed);
                dbContext.SaveChanges();
                int idBill = Billed.Id;
                return new JsonResult(idBill);
            }
            return new JsonResult("error");
        }
    }
}