namespace DotNet7.Models.RequestModel
{
    public class AddEmplyeeModelRequest
    {
        public int Fld_Id { get; set; }
        public string? Fld_MembershipNumber { get; set; }
        public string? Fld_MemberName { get; set; }
        public string? Fld_FatherName { get; set; }
        public DateTime? Fld_DOB { get; set; }
        public int Fld_MemberType { get; set; }//Customer or Employee
        public string? Fld_MobileNumber { get; set; }
        public string? Fld_EmailAddress { get; set; }
        public string? Fld_AadharNumber { get; set; }

        public int Fld_Status { get; set; }
    }


}
