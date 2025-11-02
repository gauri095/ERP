using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DEMOProject
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            GenerateNextSrNo();
            BindCustomerGrid();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string subscribeValue = ddlRateContract.SelectedValue;

            if (string.IsNullOrEmpty(subscribeValue))
            {
                // Show error or skip saving
                Response.Write("<script>alert('Please select Yes or No for Subscribe');</script>");
                return;
            }
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO tbCustomerDetails (SrNo, CustomerCode, Name, Address, CompanyMobileNo, Website, State, Country, ContactPerson, MobileNo, EmailID, RateContract) " +
                                   "VALUES (@SrNo, @CustomerCode, @Name, @Address, @CompanyMobileNo, @Website, @State, @Country, @ContactPerson, @MobileNo, @EmailID, @RateContract)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@SrNo", txtSrNo.Text);
                    cmd.Parameters.AddWithValue("@CustomerCode", txtCustomerCode.Text);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@CompanyMobileNo", txtComMobileNo.Text);
                    cmd.Parameters.AddWithValue("@Website", txtWebsite.Text);
                    cmd.Parameters.AddWithValue("@State", txtState.Text);
                    cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                    cmd.Parameters.AddWithValue("@ContactPerson", txtContactPerson.Text);
                    cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text);
                    cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text);
                    cmd.Parameters.AddWithValue("@RateContract", subscribeValue);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClearForm();
                GenerateNextSrNo();
                BindCustomerGrid(); // Refresh Grid
            }
            catch (Exception ex)
            {
               
                Response.Write("Error: " + ex.Message);
            }
        }
        private void GenerateNextSrNo()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ISNULL(MAX(SrNo), 0) + 1 FROM tbCustomerDetails";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();

                object result = cmd.ExecuteScalar();
                txtSrNo.Text = result.ToString();
            }
        }
        private void BindCustomerGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM tbCustomerDetails";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindCustomerGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindCustomerGrid();
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            //GridViewRow row = GridView1.Rows[e.RowIndex];

            //int srNo = int.Parse(((TextBox)row.Cells[0].Controls[0]).Text);
            //string CustomerCode = ((TextBox)row.Cells[1].Controls[0]).Text;
            //string name = ((TextBox)row.Cells[2].Controls[0]).Text;
            //string address = ((TextBox)row.Cells[3].Controls[0]).Text;
            //int CompanyMobileNo = int.Parse(((TextBox)row.Cells[4].Controls[0]).Text);
            //string website = ((TextBox)row.Cells[5].Controls[0]).Text;
            //string state = ((TextBox)row.Cells[6].Controls[0]).Text;
            //string country = ((TextBox)row.Cells[7].Controls[0]).Text;
            //string contactPerson = ((TextBox)row.Cells[8].Controls[0]).Text;
            //string mobileNo = ((TextBox)row.Cells[9].Controls[0]).Text;
            //string EmailID = ((TextBox)row.Cells[10].Controls[0]).Text;
            //string rate = ((TextBox)row.Cells[11].Controls[0]).Text;

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            TextBox txtSrNo = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtSrNo");
            TextBox txtCustomerCode = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCustomerCode");
           
            TextBox txtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName");
            TextBox txtAddress = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtAddress");
            TextBox txtComMobileNo = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtComMobileNo");
            TextBox txtWebsite = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtWebsite");
            TextBox txtState = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtState");
            TextBox txtCountry = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCountry");
            TextBox txtContactPerson = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtContactPerson");
            TextBox txtMobileNo = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtMobileNo");
            TextBox txtEmailID = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEmailID");
            DropDownList ddlRateContract = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlRateContract");


            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"UPDATE tbCustomerDetails 
                                 SET SrNo=@SrNo, CustomerCode=@CustomerCode, Name=@Name, Address=@Address, ComMobileNo=@CompanyMobileNo, Website=@Website State=@State,  
                                     Country=@Country, ContactPerson=@ContactPerson, MobileNo=@MobileNo, EmailID = @EmailID
                                 WHERE id=@id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SrNo", txtSrNo);
                cmd.Parameters.AddWithValue("@CustomerCode", txtCustomerCode);
                cmd.Parameters.AddWithValue("@Name", txtName);
                cmd.Parameters.AddWithValue("@Address", txtAddress);
                cmd.Parameters.AddWithValue("@CompanyMobileNo", txtComMobileNo);
                cmd.Parameters.AddWithValue("@Website", txtWebsite);
                cmd.Parameters.AddWithValue("@State", txtState);
                cmd.Parameters.AddWithValue("@Country", txtCountry);
                cmd.Parameters.AddWithValue("@ContactPerson", txtContactPerson);
                cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo);
                cmd.Parameters.AddWithValue("@EmailID", txtEmailID);
                if (ddlRateContract.SelectedValue != null && ddlRateContract.SelectedValue != "")
                {
                    cmd.Parameters.AddWithValue("@RateContract", ddlRateContract.SelectedValue);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@RateContract", DBNull.Value);
                }


                con.Open();
                cmd.ExecuteNonQuery();
            }

            GridView1.EditIndex = -1;
            BindCustomerGrid();
        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM tbCustomerDetails WHERE id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            BindCustomerGrid();
        }
    

        private void ClearForm()
        {
            txtSrNo.Text = "";
            txtCustomerCode.Text = "";
            txtName.Text = "";
            txtAddress.Text = "";
            txtComMobileNo.Text = "";
            txtWebsite.Text = "";
            txtState.Text = "";
            txtCountry.Text = "";
            txtContactPerson.Text = "";
            txtMobileNo.Text = "";
            txtEmailID.Text = "";
            ddlRateContract.SelectedIndex = -1;
        }
    
    }
}
