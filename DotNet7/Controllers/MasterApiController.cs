using Dapper;
using DotNet7.Models.RequestModel;
using DotNet7.Services.MasterServices;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using System.Text.Json.Serialization;

namespace DotNet7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MasterApiController : ControllerBase
    {
        private readonly IMasterServices _masterServices;

        public MasterApiController(IMasterServices masterServices)
        {
            _masterServices = masterServices;
        }

        [HttpPost]
        [Route("AddMember")]
        public ActionResult AddMember(AddEmplyeeModelRequest req)
        {
            try
            {
                req.Fld_Creator = User?.Claims?.FirstOrDefault(c => c.Type == "Fld_UserId")?.Value;
                dynamic? response = _masterServices.CreateMember(req).Value;
                if (response?.Fld_Status == 1)
                {
                    return Ok(response);
                }
                else
                {
                    return BadRequest("Error,Contact to Developer");
                }

            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("VerifyMember")]
        public ActionResult VerifyMember(string membershipNumber)
        {
            try
            {
                var response = _masterServices.GetAllMember(membershipNumber, "");
                if (response != null)
                {
                    if (response.Any())
                    {
                        return Ok(new { data = response, fld_Status = 1 });
                    }
                    else
                    {
                        return Ok(new { data = response, fld_Status = 0 });
                    }

                }
                else
                {

                    return BadRequest(new { response = "Error,Contact to Developer", fld_Status = 1 });
                }

            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }


        [HttpPost]
        [Route("OpenDepositAccount")]
        public ActionResult OpenDepositAccount(OpenDepositAccountRequest req)
        {
            try
            {
                req.Fld_Creator = User?.Claims?.FirstOrDefault(c => c.Type == "Fld_UserId")?.Value;
                dynamic? response = _masterServices.OpenDepositAccount(req).Value;
                if (response?.Fld_Status == 1)
                {
                    return Ok(response);
                }
                else
                {
                    return BadRequest("Error,Contact to Developer");
                }

            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("GetDepositPaymentDetails")]
        public ActionResult GetDepositPaymentDetails(string accountNumber)
        {
            try
            {
                dynamic response = _masterServices.GetDepositPaymentDetails(accountNumber);
                if (response.Rows.Count > 0)
                {

                    response = JsonConvert.SerializeObject(response);
                    return Ok(new { data = response, fld_Status = 1 });
                }
                else
                {
                    response = JsonConvert.SerializeObject(response);
                    return Ok(new { data = response, fld_Status = 0 });

                }
            }
            catch (Exception ex)
            {

                return BadRequest(new { data = ex.Message, fld_Status = -1 });
            }

        }

        [HttpPost]
        [Route("DepositAmount/{emiId}/{depositDate}/{Narration}/{penalty}")]
        public ActionResult DepositAmount(int emiId, DateTime depositDate, string Narration, int penalty)
        {
            var creator = User?.Claims?.FirstOrDefault(c => c.Type == "Fld_UserId")?.Value;
            var response = _masterServices.DepositAmount(emiId, creator, depositDate, Narration, penalty).Value;
            return Ok(response);
        }


        [HttpPost]
        [Route("LoanApplication")]
        public ActionResult LoanApplication(LoanApplicationRequest req)
        {
            try
            {
                req.Fld_Creator = User?.Claims?.FirstOrDefault(c => c.Type == "Fld_UserId")?.Value;
                dynamic? response = _masterServices.LoanApplication(req).Value;
                if (response?.Fld_Status == 1)
                {
                    return Ok(response);
                }
                else
                {
                    return BadRequest("Error,Contact to Developer");
                }

            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("GetLoanDepositDetails")]
        public ActionResult GetLoanDepositDetails(string accountNumber)
        {
            try
            {
                dynamic response = _masterServices.GetLoanPaymentDetails(accountNumber);
                if (response.Rows.Count > 0)
                {

                    response = JsonConvert.SerializeObject(response);
                    return Ok(new { data = response, fld_Status = 1 });
                }
                else
                {
                    response = JsonConvert.SerializeObject(response);
                    return Ok(new { data = response, fld_Status = 0 });

                }
            }
            catch (Exception ex)
            {

                return BadRequest(new { data = ex.Message, fld_Status = -1 });
            }

        }



        [HttpPost]
        [Route("DepositLoanAmount/{emiId}/{loanAccountNumber}/{depositDate}/{Narration}/{penalty}")]
        public ActionResult DepositLoanAmount(int emiId, string loanAccountNumber, DateTime depositDate, string Narration, int penalty)
        {
            var creator = User?.Claims?.FirstOrDefault(c => c.Type == "Fld_UserId")?.Value;
            var response = _masterServices.DepositLoanAmount(emiId, loanAccountNumber, creator, depositDate, Narration, penalty).Value;
            return Ok(response);
        }


        [HttpGet]
        [Route("GetRDReport")]
        public ActionResult GetRDReport(string accountNumber)
        {
            try
            {
                dynamic response = _masterServices.GetRDReport(accountNumber);
                if (response.Rows.Count > 0)
                {

                    response = JsonConvert.SerializeObject(response);
                    return Ok(new { data = response, fld_Status = 1 });
                }
                else
                {
                    response = JsonConvert.SerializeObject(response);
                    return Ok(new { data = response, fld_Status = 0 });

                }
            }
            catch (Exception ex)
            {

                return BadRequest(new { data = ex.Message, fld_Status = -1 });
            }

        }


        [HttpGet]
        [Route("GetLoanReport")]
        public ActionResult GetLoanReport(string accountNumber)
        {
            try
            {
                dynamic response = _masterServices.GetLoanReport(accountNumber);
                if (response.Rows.Count > 0)
                {

                    response = JsonConvert.SerializeObject(response);
                    return Ok(new { data = response, fld_Status = 1 });
                }
                else
                {
                    response = JsonConvert.SerializeObject(response);
                    return Ok(new { data = response, fld_Status = 0 });

                }
            }
            catch (Exception ex)
            {

                return BadRequest(new { data = ex.Message, fld_Status = -1 });
            }

        }

    }
}
