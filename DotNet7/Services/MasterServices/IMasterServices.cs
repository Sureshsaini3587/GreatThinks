using DotNet7.Models.RequestModel;
using DotNet7.Models.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace DotNet7.Services.MasterServices
{
    public interface IMasterServices
    {
        public JsonResult CreateMember(AddEmplyeeModelRequest model);
        public List<GetAllMembers> GetAllMember(string MembershipNumber, string CommandText);

        public JsonResult OpenDepositAccount(OpenDepositAccountRequest model);
        public DataSet GetAccounts(string commandtype);

        public DataTable GetDepositPaymentDetails(string AccountNumber);

        public JsonResult DepositAmount(int emiId, string creator);
        public JsonResult LoanApplication(LoanApplicationRequest model);
    }
}
