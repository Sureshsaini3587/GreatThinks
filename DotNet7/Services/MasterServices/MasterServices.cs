﻿using Dapper;
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


        public DataSet GetAccounts()
        {
            DataSet dataset = new DataSet();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {

                    SqlCommand cmd = new SqlCommand("Sp_GetAccounts", connection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    connection.Open();
                    adapter.Fill(dataset);
                    dataset.Tables[0].TableName = "AccountList";
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
                    cmd.Parameters.Add(new SqlParameter("@accountNumber", AccountNumber));

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

        public JsonResult DepositAmount(int emiId)
        {
            //var claims = new List<Claim>();
            //claims.Add(new Claim(ClaimTypes.Name, "Brock"));
            //claims.Add(new Claim(ClaimTypes.Email, "brockallen@gmail.com"));
            //var id = new ClaimsIdentity(claims, DefaultAuthenticationTypes.ApplicationCookie);

            //var ctx = Request.GetOwinContext();
            //var authenticationManager = ctx.Authentication;
            //authenticationManager.SignIn(id);

            //var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            //foreach (var Rol in roles)
            //{
            //    identity.AddClaim(new Claim(ClaimTypes.Role, Rol));
            //}
            //identity.AddClaim(new Claim(ClaimTypes.Name, context.UserName));
            //identity.AddClaim(new Claim(ClaimTypes.Email, user.Correo));
            //identity.AddClaim(new Claim(ClaimTypes.MobilePhone, user.Celular));
            //identity.AddClaim(new Claim("FullName", user.FullName));
            //identity.AddClaim(new Claim("Empresa", user.Empresa));
            //identity.AddClaim(new Claim("ConnectionStringsName", user.ConnectionStringsName));

            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("Sp_DepositAmount", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@emiId", emiId);
                    cmd.Parameters.AddWithValue("@Creator", "System");

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
