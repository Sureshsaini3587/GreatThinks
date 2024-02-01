using DotNet7.Models;
using DotNet7.Models.ViewModel;
using DotNet7.Services.MasterServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Diagnostics;

namespace DotNet7.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly IMasterServices _masterServices;

        //public MasterApiController(IMasterServices masterServices)
        //{
        //    _masterServices = masterServices;
        //}

        public HomeController(ILogger<HomeController> logger, IMasterServices masterServices)
        {
            _logger = logger;
            _masterServices = masterServices;

        }


        public IActionResult Index()
        {
            GetAllMembersVm getAllMembersVm = new GetAllMembersVm();
            try
            {
                getAllMembersVm.MemberList = _masterServices.GetAllMember("", "All");


                //if (response?.Fld_Status == 1)
                //{
                //    return Ok(response);
                //}
                //else
                //{
                //    return BadRequest("Error,Contact to Developer");
                //}

            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }

            return View(getAllMembersVm);
        }

        public IActionResult AllMembers()
        {
            GetAllMembersVm getAllMembersVm = new GetAllMembersVm();
            try
            {
                getAllMembersVm.MemberList = _masterServices.GetAllMember("", "All");
                //DataSet ds = new DataSet();
                //ds = _masterServices.GetAllMember("", "All");
                //TempData["data"] = ds;

                //if (response?.Fld_Status == 1)
                //{
                //    return Ok(response);
                //}
                //else
                //{
                //    return BadRequest("Error,Contact to Developer");
                //}

            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }

            return View(getAllMembersVm);
        }
        public IActionResult Registration()
        {
            return View();
        }

        public IActionResult OpenDepositAccount()
        {
            DataSet ds = new DataSet();
            ds = _masterServices.GetAccounts("DEPOSIT");
            TempData["data"] = ds;
            return View();
        }


        public IActionResult PayAmount()
        {
            //DataSet ds = new DataSet();
            //ds = _masterServices.GetAccounts();
            //TempData["Accounts"] = ds;
            return View();
        }


        public IActionResult LoanApplication()
        {
            DataSet ds = new DataSet();
            ds = _masterServices.GetAccounts("LOAN");
            TempData["data"] = ds;
            return View();
        }


        public IActionResult PayLoanAmount()
        {
            //DataSet ds = new DataSet();
            //ds = _masterServices.GetAccounts();
            //TempData["Accounts"] = ds;
            return View();
        }


        public IActionResult RDReport()
        {
            return View();
        }

        public IActionResult LoanReport()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}