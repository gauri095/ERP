using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DEMOProject
{
    public partial class EnquiryForm : System.Web.UI.Page
    {
        //string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateNextSrNo();
                BindCustomerName();
               GridData();
            }
        }
        private void GenerateNextSrNo()
        {
            //using (SqlConnection con = new SqlConnection(connectionString))
            //using (SqlCommand cmd = new SqlCommand("usp_tblEnquiry", con))
            //{
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@action", "next_srno");

            //    con.Open();
            //    object result = cmd.ExecuteScalar();
            //    txtSrNo.Text = result.ToString();
            //}


            string query = "SELECT ISNULL(MAX(SrNo), 0) + 1 FROM tblEnquiry";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();

            object result = cmd.ExecuteScalar();
            txtSrNo.Text = result.ToString();

        }
        protected void GridData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

            string query = "SELECT * FROM tblEnquiry";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand com = new SqlCommand(query, con))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(com);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds);

                    gvEnquiry.DataSource = ds;
                    gvEnquiry.DataBind();
                }
            }
        }

        //    private void LoadGrid()
        //    {
        //        using (SqlConnection con = new SqlConnection(connectionString))
        //        using (SqlCommand cmd = new SqlCommand("usp_tblEnquiry", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Action", "SELECT");
        //            cmd.Parameters.AddWithValue("@SrNo", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@CustomerCode", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@CustomerName", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@RadiatorSize", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@Pitch", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@PaintShade", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@SheetThick", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@HDG", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@Requirement", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@Transportation", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@TransportationCondition", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@DeliverySchedule", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@DrawNo", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@Quantity", DBNull.Value);


        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataSet ds = new DataSet();
        //            da.Fill(ds);

        //            gvEnquiries.DataSource = ds;
        //            gvEnquiries.DataBind();
        //        }
        //    }


        private void BindCustomerName()
        {

            string query = "SELECT CustomerCode, CustomerName FROM tblCustomer";
            SqlCommand cmd = new SqlCommand(query, con);


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlCustomers.DataSource = dt;
            ddlCustomers.DataTextField = "CustomerName";  // Text shown to user
            ddlCustomers.DataValueField = "CustomerCode";   // Value behind each item
            ddlCustomers.DataBind();

            ddlCustomers.Items.Insert(0, new ListItem("-- Select Customer --", ""));

        }
        protected void ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCustomers.SelectedIndex > 0)
            {
                string selectedCustomerCode = ddlCustomers.SelectedValue;
                txtCustomerCode.Text = selectedCustomerCode;
                DisplayCustomerDetails(selectedCustomerCode);
            }
            else
            {
                lblAddress.Text = lblPhone.Text = lblContactPerson.Text = "";
            }
        }
        private void DisplayCustomerDetails(string customerCode)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT Address, MobileNo, Contact_Person FROM tblCustomer WHERE CustomerCode = @CustomerCode", con);
                cmd.Parameters.AddWithValue("@CustomerCode", customerCode);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblAddress.Text = "Address: " + dr["Address"].ToString();
                    lblPhone.Text = "Phone: " + dr["MobileNo"].ToString();
                    lblContactPerson.Text = "Contact Person: " + dr["Contact_Person"].ToString();
                }
                else
                {
                    lblAddress.Text = "No details found.";
                    lblPhone.Text = lblContactPerson.Text = "";
                }

                con.Close();
            }
            catch (Exception ex)
            {
                lblAddress.Text = "Error: " + ex.Message;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

       
        protected void DataSubmit_Click(object sender, EventArgs e)
        {
            DateTime fromDt, toDt;
            bool fromOk = DateTime.TryParse(txtFromDate.Text, out fromDt);
            bool toOk = DateTime.TryParse(txtToDate.Text, out toDt);

            if (!fromOk || !toOk || fromDt > toDt)
            {
                // Show error
                errorMessage.InnerText = "Please enter a valid delivery schedule.";
                errorMessage.Visible = true;
                return;
            }

            string deliverySchedule = $"{fromDt:MM-dd-yyyy} - {toDt:MM-dd-yyyy}";
            bool insertSuccess = false;

            try
            {
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }

                con.Open();

                using (SqlCommand cmd = new SqlCommand("sp_tblEnquiry", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "INSERT");
                    cmd.Parameters.AddWithValue("@SrNo", Convert.ToInt32(txtSrNo.Text));
                    cmd.Parameters.AddWithValue("@EnquiryNo", Convert.ToInt32(txtEnquiryNo.Text));
                    cmd.Parameters.AddWithValue("@CustomerCode", txtCustomerCode.Text);
                    cmd.Parameters.AddWithValue("@CustomerName", ddlCustomers.SelectedValue);
                    cmd.Parameters.AddWithValue("@Place", txtPlace.Text);
                    cmd.Parameters.AddWithValue("@RadiatorSize", txtRadiatorSize.Text);
                    cmd.Parameters.AddWithValue("@Width", txtWidth.Text);
                    cmd.Parameters.AddWithValue("@CD", txtCD.Text);
                    cmd.Parameters.AddWithValue("@SheetThick", txtSheetThick.Text);
                    cmd.Parameters.AddWithValue("@Tins", Convert.ToInt32(txtTins.Text));
                    cmd.Parameters.AddWithValue("@Weight", Convert.ToInt32(txtWeight.Text));
                    cmd.Parameters.AddWithValue("@HDG", ddlHDG.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Primer", Convert.ToInt32(txtPrimer.Text));
                    cmd.Parameters.AddWithValue("@MIO", Convert.ToInt32(txtMIO.Text));
                    cmd.Parameters.AddWithValue("@PU_Tapecount", Convert.ToInt32(txtPUTapeCount.Text));
                    cmd.Parameters.AddWithValue("@PaintShade", txtPaintShade.Text);
                    cmd.Parameters.AddWithValue("@Total_DFT", Convert.ToInt32(txtTotalDFT.Text));
                    cmd.Parameters.AddWithValue("@Varnish", ddlVP.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Pitch", txtPitch.Text);
                    cmd.Parameters.AddWithValue("@Transportation", ddlTransportation.Text);
                    cmd.Parameters.AddWithValue("@TransportationCondition", ddlTransportationCondition.Text);
                    cmd.Parameters.AddWithValue("@DeliverySchedule", deliverySchedule);
                    cmd.Parameters.AddWithValue("@DrawingNo", Convert.ToInt32(txtDrawingNo.Text));
                    cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(txtQuantity.Text));

                    //con.Open();
                    cmd.ExecuteNonQuery(); // Or use ExecuteScalar if you want NewID
                    insertSuccess = true;
                }
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                errorMessage.InnerText = $"Error saving data: {ex.Message}";
                errorMessage.Visible = true;
                return;
            }

            if (insertSuccess)
            {
                // Generate the next Serial Number
                GenerateNextSrNo();

                string wantsQuotation = ddlQuotation.SelectedValue;

                if (wantsQuotation == "Yes")
                {
                    // Redirect to QuotationForm.aspx with EnquiryNo
                    int enquiryNo = Convert.ToInt32(txtEnquiryNo.Text);
                    Response.Redirect($"QuotationForm.aspx?EnquiryNo={enquiryNo}");
                }
                else
                {
                    // Stay on current page and show confirmation
                    successMessage.InnerText = "Enquiry saved successfully.";
                    successMessage.Visible = true;

                    // Refresh data in GridView
                    GridData();
                }
            }

        }

        protected void gvEnquiry_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvEnquiry.EditIndex = e.NewEditIndex;
            GridData();
        }

        protected void gvEnquiry_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvEnquiry.EditIndex = -1;
            GridData();
        }

        protected void gvEnquiry_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = gvEnquiry.Rows[e.RowIndex];
            int SrNo = Convert.ToInt32(gvEnquiry.DataKeys[e.RowIndex].Value);

            // Extract updated values from the TextBoxes
            string enquiryNo = ((TextBox)row.FindControl("txt_EnquiryNo")).Text;
            string customerCode = ((TextBox)row.FindControl("txt_CustomerCode")).Text;
            string customerName = ((TextBox)row.FindControl("txt_CustomerName")).Text;
            string place = ((TextBox)row.FindControl("txt_Place")).Text;
            string radiatorSize = ((TextBox)row.FindControl("txt_RadiatorSize")).Text;
            string width = ((TextBox)row.FindControl("txt_Width")).Text;
            string cd = ((TextBox)row.FindControl("txt_CD")).Text;
            string sheetThick = ((TextBox)row.FindControl("txt_ST")).Text;
            int tins = Convert.ToInt32(((TextBox)row.FindControl("txt_Tins")).Text);
            int weight = Convert.ToInt32(((TextBox)row.FindControl("txt_Weight")).Text);
            string hdg = ((TextBox)row.FindControl("txt_HDG")).Text;
            int primer = Convert.ToInt32(((TextBox)row.FindControl("txt_Primer")).Text);
            int mio = Convert.ToInt32(((TextBox)row.FindControl("txt_MIO")).Text);
            int puTapeCount = Convert.ToInt32(((TextBox)row.FindControl("txt_PU_TapeCount")).Text);
            string paintShade = ((TextBox)row.FindControl("txt_PaintShade")).Text;
            int totalDFT = Convert.ToInt32(((TextBox)row.FindControl("txt_Total_DFT")).Text);
            string varnish = ((TextBox)row.FindControl("txt_Varnish")).Text;
            string pitch = ((TextBox)row.FindControl("txt_Pitch")).Text;
            string transportation = ((TextBox)row.FindControl("txt_Transportation")).Text;
            string transportationCondition = ((TextBox)row.FindControl("txt_TransportationCondition")).Text;
            string deliverySchedule = ((TextBox)row.FindControl("txt_DeliverySchedule")).Text;
            int drawingNo = Convert.ToInt32(((TextBox)row.FindControl("txt_DrawingNo")).Text);
            int quantity = Convert.ToInt32(((TextBox)row.FindControl("txt_Quantity")).Text);

            using (SqlCommand cmd = new SqlCommand("sp_tblEnquiry", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                cmd.Parameters.AddWithValue("@SrNo", SrNo);
                cmd.Parameters.AddWithValue("@EnquiryNo", enquiryNo);
                cmd.Parameters.AddWithValue("@CustomerCode", customerCode);
                cmd.Parameters.AddWithValue("@CustomerName", customerName);
                cmd.Parameters.AddWithValue("@Place", place);
                cmd.Parameters.AddWithValue("@RadiatorSize", radiatorSize);
                cmd.Parameters.AddWithValue("@Width", width);
                cmd.Parameters.AddWithValue("@CD", cd);
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
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvEnquiry.EditIndex = -1;
            GridData(); // Rebind updated data
        }

        protected void gvEnquiry_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            //int SrNo = Convert.ToInt32(gvEnquiry.DataKeys[e.RowIndex].Values["SrNo"]);

            //using (SqlCommand cmd = new SqlCommand("sp_tblEnquiry", con))
            //{
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@Action", "DELETE");
            //    cmd.Parameters.AddWithValue("@SrNo", SrNo);

            //    con.Open();
            //    cmd.ExecuteNonQuery();
            //    con.Close();
            //}

            //// Refresh the GridView after deletion
            //GridData();
            string SrNo = gvEnquiry.DataKeys[e.RowIndex].Values["SrNo"].ToString();

            //SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tblEnquiry WHERE [SrNo] = @SrNo", con);
            cmd.Parameters.AddWithValue("@SrNo", SrNo);
            cmd.ExecuteNonQuery();
            con.Close();
            GridData();
        }

        private void ClearForm()
        {
            txtEnquiryNo.Text = "";
            txtCustomerCode.Text = "";
            ddlCustomers.SelectedIndex = 0;
            txtRadiatorSize.Text = "";
            txtPitch.Text = "";
            txtPaintShade.Text = "";
            txtSheetThick.Text = "";
            ddlHDG.SelectedIndex = 0;
            ddlTransportation.SelectedIndex = 0;
            ddlTransportationCondition.SelectedIndex = 0;
            ddlVP.SelectedIndex = 0;
            txtMIO.Text = "";
            txtPlace.Text = "";
            txtPrimer.Text = "";
            txtPUTapeCount.Text = "";
            txtWidth.Text = "";
            txtWeight.Text = "";
            txtCD.Text = "";
            txtFromDate.Text = "";
            txtToDate.Text = "";
            txtTins.Text = "";
            txtTotalDFT.Text = "";
        }
    }
}

