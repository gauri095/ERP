using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DEMOProject
{
    public partial class QuotationForm : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadCustomers();
            }
        }
        private void LoadCustomers()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT CustomerName FROM tblEnquiry", con);
                con.Open();
                ddlFilterCustomer.DataSource = cmd.ExecuteReader();
                ddlFilterCustomer.DataTextField = "CustomerName";
                ddlFilterCustomer.DataValueField = "CustomerName";
                ddlFilterCustomer.DataBind();
                ddlFilterCustomer.Items.Insert(0, new ListItem("--Select Customer--", ""));
            }
        }

        //[System.Web.Services.WebMethod]
        //public static List<string> GetEnquiries(string customerName)
        //{
        //    List<string> enquiryNos = new List<string>();
        //    string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT EnquiryNo FROM tblEnquiry WHERE CustomerName = @CustomerName", con);
        //        cmd.Parameters.AddWithValue("@CustomerName", customerName);
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //        {
        //            enquiryNos.Add(reader["EnquiryNo"].ToString());
        //        }
        //    }
        //    return enquiryNos;
        //}

        [System.Web.Services.WebMethod]
        public static List<string> GetEnquiries(string customerName)
        {
            List<string> enquiryNos = new List<string>();

            try
            {
                if (string.IsNullOrEmpty(customerName))
                {
                    throw new ArgumentException("Customer name cannot be empty");
                }

                string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"]?.ConnectionString;
                if (string.IsNullOrEmpty(connectionString))
                {
                    throw new Exception("Database connection string not found or is empty");
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT EnquiryNo FROM tblEnquiry WHERE CustomerName = @CustomerName", con);
                    cmd.Parameters.AddWithValue("@CustomerName", customerName);

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            if (!reader.IsDBNull(0))
                            {
                                enquiryNos.Add(reader["EnquiryNo"].ToString());
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception (you can use your preferred logging method)
                System.Diagnostics.Debug.WriteLine("Error in GetEnquiries: " + ex.Message);

                // Re-throw the exception to return it to the client
                throw;
            }

            return enquiryNos;
        }

        [System.Web.Services.WebMethod]
        public static object GetEnquiryDetails(string enquiryNo)
        {
            var result = new
            {
                EnquiryNo = "",
                CustomerName = "",
                CustomerCode = "",
                Place = "",
                RadiatorSize = "",
                Width = "",
                CD = "",
                SheetThick = "",
                Tins = "",
                Weight = "",
                HDG = "",
                Primer = "",
                MIO = "",
                PUTapeCount = "",
                PaintShade = "",
                TotalDFT = "",
                VP = "",
                Pitch = "",
                Transportation = "",
                TransportationCondition = "",
                FromDate = "",
                ToDate = "",
                DrawingNo = "",
                Quantity = "",

            };

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"]?.ConnectionString;
                if (string.IsNullOrEmpty(connectionString))
                    throw new Exception("Connection string not configured");

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM tblEnquiry WHERE EnquiryNo = @EnquiryNo";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EnquiryNo", enquiryNo);
                        cmd.Parameters.AddWithValue("@CustomerCode", CustomerCode);
                        cmd.Parameters.AddWithValue("@CustomerName", CustomerName);
                        cmd.Parameters.AddWithValue("@Place", Place);
                        cmd.Parameters.AddWithValue("@RadiatorSize", radiatorSize);
                        cmd.Parameters.AddWithValue("@Width", width);
                        cmd.Parameters.AddWithValue("@CD", CD);
                        cmd.Parameters.AddWithValue("@SheetThick", sheetThick);
                        cmd.Parameters.AddWithValue("@Tins", tins);
                        cmd.Parameters.AddWithValue("@Weight", weight);
                        cmd.Parameters.AddWithValue("@HDG", hdg);
                        cmd.Parameters.AddWithValue("@Primer", primer);
                        cmd.Parameters.AddWithValue("@MIO", mio);
                        cmd.Parameters.AddWithValue("@PU_Tapecount", puTapeCount);
                        cmd.Parameters.AddWithValue("@PaintShade", paintShade);
                        cmd.Parameters.AddWithValue("@Total_DFT", totalDFT);
                        cmd.Parameters.AddWithValue("@Varnish", varnish);
                        cmd.Parameters.AddWithValue("@Pitch", pitch);
                        cmd.Parameters.AddWithValue("@Transportation", transportation);
                        cmd.Parameters.AddWithValue("@TransportationCondition", transportationCondition);
                        cmd.Parameters.AddWithValue("@DeliverySchedule", deliverySchedule);
                        cmd.Parameters.AddWithValue("@DrawingNo", drawingNo);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                result = new
                                {
                                    SrNo = reader["SrNo"].ToString(),
                                    EnquiryNo = reader["EnquiryNo"].ToString(),
                                    CustomerName = reader["CustomerName"].ToString(),
                                    CustomerCode = reader["CustomerCode"].ToString(),
                                    Place = reader["Place"].ToString(),
                                    RadiatorSize = reader["RadiatorSize"].ToString(),
                                    Width = reader["Width"].ToString(),
                                    CD = reader["CD"].ToString(),
                                    SheetThick = reader["SheetThick"].ToString(),
                                    Tins = reader["Tins"].ToString(),
                                    Weight = reader["Weight"].ToString(),
                                    HDG = reader["HDG"].ToString(),
                                    Primer = reader["Primer"].ToString(),
                                    MIO = reader["MIO"].ToString(),
                                    PUTapeCount = reader["PUTapeCount"].ToString(),
                                    PaintShade = reader["PaintShade"].ToString(),
                                    TotalDFT = reader["TotalDFT"].ToString(),
                                    VP = reader["VP"].ToString(),
                                    Pitch = reader["Pitch"].ToString(),
                                    Transportation = reader["Transportation"].ToString(),
                                    TransportationCondition = reader["TransportationCondition"].ToString(),
                                    FromDate = reader["FromDate"].ToString(),
                                    ToDate = reader["ToDate"].ToString(),
                                    DrawingNo = reader["DrawingNo"].ToString(),
                                    Quantity = reader["Quantity"].ToString()
                                };
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error in GetEnquiryDetails: " + ex.Message);
                throw;
            }

            return result;
        }

    }
}