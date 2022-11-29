using DotNet7.Data;
using System.Security.Claims;

namespace DotNet7.Models.RequestModel
{
    public class LoanApplicationRequest
    {
        public int Fld_Id { get; set; }
        public string? Fld_AccountNumber { get; set; }
        public string? Fld_MembershipNumber { get; set; }
        public decimal Fld_RequiredLoanAmount { get; set; }
        public string? Fld_LoanScheme { get; set; }
        public DateTime Fld_PromiseToPayDate { get; set; }
        public DateTime Fld_LoanSanctionDate { get; set; }
        public string? Fld_PanNumber { get; set; }

        public string? Fld_Creator { get; set; }
        public int Status { get; set; } 


    }
}
