using System.Data.SqlClient;
using System.Data;
using Dapper;
using DotNet7.Models.Login;
using System.Security.Claims;

namespace DotNet7.Services.MasterServices
{
    public class LoginServices : ILoginServices
    {

        private readonly IConfiguration _configuration;

        public LoginServices(IConfiguration configuration)
        {
            _configuration = configuration;
            ConnectionString = _configuration.GetConnectionString("DbConnection");
            ProviderName = "System.Data.SqlClient";
        }

        public string? ConnectionString { get; }
        public string ProviderName { get; }

        public IDbConnection Connection
        {
            get { return new SqlConnection(ConnectionString); }
        }


        public List<UserDetails> Login(string username, string password)
        {
            using (IDbConnection dbConnection = Connection)
            {

                dbConnection.Open();
                var response = dbConnection.Query<UserDetails>("Sp_Login", new { @userName = username, @pwd = password }, commandType: CommandType.StoredProcedure).ToList();
                //return response.loginstatus;
                //var status1 = response[0].LoginStatus;
                int status = Convert.ToInt32(response.FirstOrDefault()?.LoginStatus);
                return response;

            }
        }



        public Task<ClaimsPrincipal> TransformAsync(ClaimsPrincipal principal)
        {
            ClaimsIdentity claimsIdentity = new ClaimsIdentity();
            var claimType = "myNewClaim";
            if (!principal.HasClaim(claim => claim.Type == claimType))
            {
                claimsIdentity.AddClaim(new Claim(claimType, "myClaimValue"));
            }

            principal.AddIdentity(claimsIdentity);
            return Task.FromResult(principal);
        }
    }
}
