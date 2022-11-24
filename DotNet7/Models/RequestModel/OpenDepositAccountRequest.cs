namespace DotNet7.Models.RequestModel
{
    public class OpenDepositAccountRequest
    {
        public string Fld_MembershipNumber { get; set; }
        public string? Fld_AccountNumber { get; set; }
        public string Fld_SchemeCode { get; set; }
        //public DateOnly Fld_MaturityDate { get; set; }

        public string? Fld_StartDate { get; set; }
        public string? Fld_MaturityDate { get; set; }
        public decimal Fld_Amount { get; set; }
        public string? Fld_Creator { get; set; }

        public int Fld_Status { get; set; }

    }
}
