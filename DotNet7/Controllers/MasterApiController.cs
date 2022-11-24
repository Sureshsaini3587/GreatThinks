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
                // req = JsonConvert.DeserializeObject<dynamic>(req.ToString());
                //    req = JsonConvert.SerializeObject(req.ToString());
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
        [Route("DepositAmount/{emiId}")]
        public ActionResult DepositAmount(int emiId)
        {
            var response = _masterServices.DepositAmount(emiId).Value;
            return Ok(response);
        }
    }
}
