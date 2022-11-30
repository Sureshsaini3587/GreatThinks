using DotNet7.Data;
using DotNet7.Models.Login;
using DotNet7.Services.MasterServices;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace DotNet7.Controllers
{
    public class BaseController : Controller
    {
        private readonly ILoginServices _loginServices;

        public BaseController(ILoginServices loginServices)
        {
            _loginServices = loginServices;
        }



        [Route("/login")]
        public IActionResult Login()
        {
            return View();
        }



        [Route("/logout")]
        [HttpPost]
        public async Task<string> LogoutAsync()
        {
            //await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return "logout Successfully";
            //await HttpContext.SignOutAsync();
            //var a = User.Identity.Name;
            //return RedirectToAction("Login", "Base");


        }


        [Route("/login/{UserId}/{pwd}")]
        public async Task<int> DoLoginAsync(string UserId, string pwd)
        {
            var response = _loginServices.Login(UserId, pwd).FirstOrDefault();

            if (response?.LoginStatus == 1)
            {
                var claims = new List<Claim>
                 {
                     new Claim(ClaimTypes.NameIdentifier,response?.Fld_UserId??""),
                     new Claim(ClaimTypes.Name,response?.Fld_MemberName??""),
                     new Claim("Fld_UserId",response?.Fld_UserId??""),
                     new Claim("Fld_MembershipNumber",response?.Fld_MembershipNumber??""),
                     new Claim("LoginStatus",response?.LoginStatus.ToString()??""),
                     new Claim("Fld_MemberName",response?.Fld_MemberName??""),
                     new Claim("Fld_EmailAddress",response?.Fld_EmailAddress??""),

                 };

                var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var principal = new ClaimsPrincipal(identity);

                //await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, new AuthenticationProperties { IsPersistent = true, ExpiresUtc = DateTime.UtcNow.AddMinutes(20)});
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, new AuthenticationProperties());

            }

            return response.LoginStatus;

        }

    }
}
