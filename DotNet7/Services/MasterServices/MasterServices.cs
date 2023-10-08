using Azure;
using Dapper;
using DotNet7.Data;
using DotNet7.Models.RequestModel;
using DotNet7.Models.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NuGet.Protocol;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Security.Claims;

namespace DotNet7.Services.MasterServices
{
    public class MasterServices : IMasterServices
    {
        private readonly IConfiguration _configuration;

        public MasterServices(IConfiguration configuration)
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


        public JsonResult CreateMember(AddEmplyeeModelRequest model)
        {
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    var response = dbConnection.Query<AddEmplyeeModelRequest>("Sp_MemberAddUpdate",
                            new
                            {
                                @Fld_MembershipNumber = model.Fld_MembershipNumber,
                                @Fld_MemberName = model.Fld_MemberName,
                                @Fld_DOB = model.Fld_DOB,
                                @Fld_FatherName = model.Fld_FatherName,
                                @Fld_MobileNumber = model.Fld_MobileNumber,
                                @Fld_EmailAddress = model.Fld_EmailAddress,
                                @Fld_AadharNumber = model.Fld_AadharNumber,
                                @Fld_MemberType = model.Fld_MemberType,
                                @Fld_Creator = model.Fld_Creator ?? "System",
                                @CommandType = "Add"
                            }, commandType: CommandType.StoredProcedure);

                    return new JsonResult(new
                    {
                        Fld_MembershipNumber = response?.FirstOrDefault()?.Fld_MembershipNumber,
                        Fld_Status = response?.FirstOrDefault()?.Fld_Status,
                    });

                }
            }
            catch (Exception ex)
            {
                return new JsonResult(new { Fld_Status = -1, ErrorMsg = ex.Message });
            }
        }


        public List<GetAllMembers> GetAllMember(string MembershipNumber, string CommandText)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                var response = dbConnection.Query<GetAllMembers>("Sp_GetAllMembers", new
                {
                    MembershipNumber = MembershipNumber,
                    CommandText = CommandText
                }, commandType: CommandType.StoredProcedure).ToList();
                dbConnection.Close();
                return (response);
            }
        }

        public JsonResult OpenDepositAccount(OpenDepositAccountRequest model)
        {
            try
            {

                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    var response = dbConnection.Query<OpenDepositAccountRequest>("Sp_OpenDepositAccount",
                            new
                            {
                                Fld_MembershipNumber = model.Fld_MembershipNumber,
                                Fld_SchemeCode = model.Fld_SchemeCode,
                                Fld_MaturityDate = model.Fld_MaturityDate,
                                Fld_Amount = model.Fld_Amount,
                                Fld_Creator = model.Fld_Creator ?? "System",
                                Fld_StartDate = model.Fld_StartDate ?? Convert.ToString(DateTime.UtcNow)
                            }, commandType: CommandType.StoredProcedure);

                    return new JsonResult(new
                    {
                        Fld_AccountNumber = response?.FirstOrDefault()?.Fld_AccountNumber,
                        Fld_Status = response?.FirstOrDefault()?.Fld_Status,
                    });

                }
            }
            catch (Exception ex)
            {
                return new JsonResult(new { Fld_Status = -1, ErrorMsg = ex.Message });
            }

        }


        public DataSet GetAccounts(string commandtype)
        {
            DataSet dataset = new DataSet();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {

                    SqlCommand cmd = new SqlCommand("Sp_GetAccounts", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@accounttype", commandtype);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    connection.Open();
                    adapter.Fill(dataset);
                    dataset.Tables[0].TableName = "AccountList";
                    dataset.Tables[1].TableName = "SchemeList";
                    //var test = JsonConvert.SerializeObject(dataset);

                    return dataset;
                }
            }
            catch (Exception ex)
            {
                return (dataset);

            }
        }

        public DataTable GetDepositPaymentDetails(string AccountNumber)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {

                    SqlCommand cmd = new SqlCommand("Sp_GetDueAmountDetails", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@loanAccountNumber", AccountNumber));

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    connection.Open();
                    adapter.Fill(dt);
                    dt.TableName = "DueAmountDetails";
                    return dt;
                }
            }
            catch (Exception ex)
            {
                return (dt);

            }
        }

        public JsonResult DepositAmount(int emiId, string creator, DateTime depositDate, string Narration, int penalty)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {

                    SqlCommand cmd = new SqlCommand("Sp_DepositAmount", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@emiId", emiId);
                    cmd.Parameters.AddWithValue("@Creator", creator);
                    cmd.Parameters.AddWithValue("@depositDate", depositDate);
                    cmd.Parameters.AddWithValue("@narration", Narration ?? "");
                    cmd.Parameters.AddWithValue("@penalty", penalty);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    connection.Open();
                    adapter.Fill(dt);
                    return new JsonResult(new
                    {
                        Fld_Status = dt.Rows[0]["Flag"],
                        TxnNo = dt.Rows[0]["TxnNo"],

                    });
                }
            }
            catch (Exception ex)
            {
                return new JsonResult(new
                {
                    Fld_Status = -1,
                    Exception = ex.Message,

                });

            }
        }

        public JsonResult LoanApplication(LoanApplicationRequest model)
        {
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    var response = dbConnection.Query<LoanApplicationRequest>("Sp_LoanApplication", new
                    {
                        @Fld_MembershipNumber = model.Fld_MembershipNumber,
                        @Fld_RequiredLoanAmount = model.Fld_RequiredLoanAmount,
                        @Fld_LoanScheme = model.Fld_LoanScheme,
                        @Fld_PromiseToPayDate = model.Fld_PromiseToPayDate,
                        @Fld_LoanSanctionDate = model.Fld_LoanSanctionDate,
                        @Fld_PanNumber = model.Fld_PanNumber,
                        @Fld_Creator = model.Fld_Creator,
                    }, commandType: CommandType.StoredProcedure);
                    if (response?.FirstOrDefault()?.Status == 1)
                    {
                        return new JsonResult(new { Fld_AccountNumber = response?.FirstOrDefault()?.Fld_AccountNumber, Fld_Status = response?.FirstOrDefault()?.Status });
                    }
                    else
                    {
                        return new JsonResult(new { Fld_AccountNumber = response?.FirstOrDefault()?.Fld_AccountNumber, Fld_Status = response?.FirstOrDefault()?.Status });
                    }

                }
            }
            catch (Exception ex)
            {

                return new JsonResult(new { Fld_AccountNumber = "", Fld_Status = 0 });
            }

        }

        public DataTable GetLoanPaymentDetails(string AccountNumber)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {

                    SqlCommand cmd = new SqlCommand("Sp_GetDueLoanAmountDetails", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@loanAccountNumber", AccountNumber));

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    connection.Open();
                    adapter.Fill(dt);
                    dt.TableName = "DueAmountDetails";
                    return dt;
                }
            }
            catch (Exception ex)
            {
                return (dt);

            }
        }


        public JsonResult DepositLoanAmount(int emiId, string loanAccountNumber, string creator, DateTime depositDate, string Narration, int penalty)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {

                    SqlCommand cmd = new SqlCommand("Sp_DepositLoanAmount", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@emiId", emiId);
                    cmd.Parameters.AddWithValue("@loanAccountNumber", loanAccountNumber);
                    cmd.Parameters.AddWithValue("@Creator", creator);
                    cmd.Parameters.AddWithValue("@depositDate", depositDate);
                    cmd.Parameters.AddWithValue("@narration", Narration ?? "");
                    cmd.Parameters.AddWithValue("@penalty", penalty);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    connection.Open();
                    adapter.Fill(dt);
                    return new JsonResult(new
                    {
                        Fld_Status = dt.Rows[0]["Flag"],
                        TxnNo = dt.Rows[0]["TxnNo"],

                    });
                }
            }
            catch (Exception ex)
            {
                return new JsonResult(new
                {
                    Fld_Status = -1,
                    Exception = ex.Message,

                });

            }
        }

    }
}
