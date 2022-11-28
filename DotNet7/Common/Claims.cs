//using Microsoft.AspNetCore.Authentication;
//using System.Security.Claims;
//using System.Security.Principal;
//using System.Web;

//namespace DotNet7.Common
//{
//    public static class Claims
//    {

//        public static void AddUpdateClaim(this IPrincipal currentPrincipal, string key, string value)
//        {
//            var identity = currentPrincipal.Identity as ClaimsIdentity;
//            if (identity == null)
//                return;

//            // check for existing claim and remove it
//            var existingClaim = identity.FindFirst(key);
//            if (existingClaim != null)
//                identity.RemoveClaim(existingClaim);

//            // add new claim
//            identity.AddClaim(new Claim(key, value));
//            //var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
//            //authenticationManager.AuthenticationResponseGrant = new AuthenticationResponseGrant(new ClaimsPrincipal(identity), new AuthenticationProperties() { IsPersistent = true });


//            // get context of the authentication manager
//            var authenticationManager = System.Web.HttpContext.GetOwinContext().Authentication;

            


//            // tell the authentication manager to use this new identity
//            authenticationManager.AuthenticationResponseGrant =
//                new AuthenticationResponseGrant(
//                    new ClaimsPrincipal(identity),
//                    new AuthenticationProperties { IsPersistent = true }
//                );
//        }

//        public static string GetClaimValue(this IPrincipal currentPrincipal, string key)
//        {
//            var identity = currentPrincipal.Identity as ClaimsIdentity;
//            if (identity == null)
//                return null;

//            var claim = identity.Claims.FirstOrDefault(c => c.Type == key);

//            // ?. prevents a exception if claim is null.
//            return claim?.Value;
//        }
//    }
//}
