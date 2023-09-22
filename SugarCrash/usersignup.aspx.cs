using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SugarCrash
{
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e) //Sign up button
        {
            if (checkUserExists())
            {
                Response.Write("<script>alert('A user already exists with the same ID, please try another ID :( '); </script> ");
            }
            else
            {
                signUpNewUser();
            }
        }


        bool checkUserExists() //user defined method to check if same username (ID) exists :: when returned true which means id exists
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_management_table4 WHERE member_id='" + TextBox8.Text.Trim() + "';" ,con);
                SqlDataAdapter da = new SqlDataAdapter(cmd); //this will keep the connection open even aftert he query is fired else usually the connection closes after query is fired.
                System.Data.DataTable dt = new System.Data.DataTable(); //temporary for showing data in table format
                da.Fill(dt); //fills the username from the db into the table

                if (dt.Rows.Count >= 1) 
                {
                    return true; //if data with same id is present return true and then shows use another id
                }
                else
                {
                    return false; //if data with same id isnt there then exeecute signUpNewUser
                }
            

                con.Close();
                Response.Write("<script> alert('Sign Up Successful. Go to User Login to Login'); </script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
                return false;
            }


            
        }

        void signUpNewUser() //user defined method for signing up new user
        {
            //Response.Write("<script>alert('Testing'); </script> ");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO member_management_table4 (full_name,dob,contact,email,state,city,pincode,address,member_id,password,account_status) values (@full_name,@dob,@contact,@email,@state,@city,@pincode,@address,@member_id,@password,@account_status)", con);
                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending"); //first time sign up so by default hardcoded as pending

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Sign Up Successful. Go to User Login to Login'); </script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }
    }
}