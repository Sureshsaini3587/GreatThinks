using DotNet7.Models;
using DotNet7.Models.ViewModel;
using DotNet7.Services.MasterServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.IO;
using System.Diagnostics;

using System;

using SelectPdf;
using Syncfusion.Pdf.Graphics;

namespace DotNet7.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly IMasterServices _masterServices;
        private readonly Microsoft.AspNetCore.Hosting.IHostingEnvironment _hostingEnvironment;


        public HomeController(ILogger<HomeController> logger, IMasterServices masterServices, Microsoft.AspNetCore.Hosting.IHostingEnvironment hostingEnvironment)
        {
            _logger = logger;
            _masterServices = masterServices;
            _hostingEnvironment = hostingEnvironment;

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


        [Route("/download/loanreport")]
        public IActionResult GenerateLoanReport(string accountNumber)
        {
            string webRootPath = _hostingEnvironment.WebRootPath;

            //var con = claims.FindFirstValue("ConnectionString");
            var CompanyName = "Great Thinks";
            var Logo = "Great Thinks";
            DateTime _date = DateTime.UtcNow.AddMinutes(330);

            try
            {

                DataTable response = _masterServices.GetLoanReport("accountNumber");
                if (response.Rows.Count > 0)
                {
                    string FilePath = _hostingEnvironment.ContentRootPath + @"\wwwroot\cp\PdfTemplate\RDReport.html";

                    StreamReader str = new StreamReader(FilePath);
                    string letter = str.ReadToEnd();
                    str.Close();
                    string body = "";
                    for (int i = 0; i < response.Rows.Count; i++)
                    {
                        body += "<tr>";
                        body += "<td  style='text-align:center'>" + (i + 1) + "</td>";
                        body += "<td  style='text-align:center'>" + response.Rows[i]["Fld_Amount"] + "</td>";
                        body += "<td  style='text-align:center'>" + response.Rows[i]["Fld_EmiDate"] + " </td>";
                        body += "<td  style='text-align:center'>" + response.Rows[i]["Fld_Status"] + " </td>";
                        body += "<td style='text-align:right'>" + response.Rows[i]["Fld_DepositDate"] + " </td>";
                        body += "<td style='text-align:right'>" + response.Rows[i]["Fld_Depositor"] + " </td>";
                        body += "<td style='text-align:right'>" + response.Rows[i]["Fld_Penalty"] + " </td>";
                        body += "<td style='text-align:right'>" + response.Rows[i]["Fld_Narration"] + " </td>";
                        body += "</tr>";
                    }

                    letter = letter.Replace("$$tbody$$", body);
                    letter = letter.Replace("$$company$$", CompanyName);
                    letter = letter.Replace("$$Logo$$", "https://greatthinks.in/logogt.png");


                    letter = letter.Replace("$$Address$$", "Uniyara Khurd");
                    letter = letter.Replace("$$city$$", "Kekri");
                    letter = letter.Replace("$$state$$,", "Rajasthan");
                    letter = letter.Replace("$$Zip_Code$$", "304502");



                    //HtmlToPdfConverter converter = new HtmlToPdfConverter();
                    ////WebKitConverterSettings settings = new WebKitConverterSettings();

                    ////settings.WebKitPath = Path.Combine(_hostingEnvironment.ContentRootPath + "/QtBinariesWindows");
                    ////settings.Margin.All = 20;
                    ////settings.PdfPageSize = PdfPageSize.A4;





                    ////converter.ConverterSettings = settings;

                    Process proc = new Process();
                    proc.StartInfo.UseShellExecute = true;
                    proc.StartInfo.FileName = "file name here.pdf";
                    proc.Start();

                    //letter = letter.Replace("StrTag", "<").Replace("EndTag", ">");
                    ////HtmlToPdf htmlToPdf = new HtmlToPdf();
                    ////PdfDocument pdfDocument = htmlToPdf.ConvertHtmlString(letter);
                    ////byte[] pdf = pdfDocument.Save();
                    ////pdfDocument.Close();
                    ////return File(pdf, "application/pdf", "test.pdf");
                    //using (Converter converter = new Converter("input.html",""))
                    //{
                    //    PdfConvertOptions options = new PdfConvertOptions();

                    //    converter.Convert("converted.pdf", options);
                    //}

                    //var Renderer = new IronPdf.HtmlToPdf();
                    //var PDF = Renderer.RenderHtmlAsPdf("<h1>Hello IronPdf</h1>");

                    //PDF.SaveAs("output.pdf");

                    //var converter = new htmltopdfconverter();
                    //converter.converthtmltopdf(letter, $"loanreport_{accountnumber}");
                }

            }
            catch (Exception ex)
            { }

            return Ok();

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