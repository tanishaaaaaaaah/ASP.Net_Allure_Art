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
    public partial class adminmembermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }


        //Link button GO :: Blue Tick
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }

        //Link button ACTIVE :: Green
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");
        }

        //Link button PENDING :: Yellow
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }

        //Link button DEACTIVE :: Red
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("deactive");
        }

        //Link button DeleteUser :: Red
        protected void Button5_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        //user defined function GetMemberByID
        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_management_table4 WHERE member_id='" + TextBox1.Text.Trim() + "' ", con);
                SqlDataReader dr = cmd.ExecuteReader(); //checks if we're getting some data or not

                if (dr.HasRows) //if rows exist::true then execute below block
                {
                    while (dr.Read()) //while dr object reads the data
                    {
                        TextBox2.Text = dr.GetValue(0).ToString(); //Fullname
                        TextBox3.Text = dr.GetValue(10).ToString(); //AccountStatus
                        TextBox7.Text = dr.GetValue(1).ToString();//dob
                        TextBox4.Text = dr.GetValue(2).ToString();//contact
                        TextBox5.Text = dr.GetValue(3).ToString();//email_id
                        TextBox8.Text = dr.GetValue(4).ToString();//state
                        TextBox9.Text = dr.GetValue(5).ToString();//city
                        TextBox10.Text = dr.GetValue(6).ToString();//pincode
                        TextBox6.Text = dr.GetValue(7).ToString();//address
                    }                
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //user defined function updateMemberStatus
        void updateMemberStatusByID(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_management_table4 SET account_status ='" + status + "' WHERE member_id='" + TextBox1.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Member status updated!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //user defined function DeleteMember
        void deleteMemberByID()
        {
            if (TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Entry cannot be null');</script>");
            }
            else
            { 
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM member_management_table4  WHERE member_id='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member deleted successfully!');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        //user defined function clearForm
        void clearForm()
        {
            TextBox2.Text = ""; //Fullname
            TextBox3.Text = ""; //AccountStatus
            TextBox7.Text = "";//dob
            TextBox4.Text = "";//contact
            TextBox5.Text = "";//email_id
            TextBox8.Text = "";//state
            TextBox9.Text = "";//city
            TextBox10.Text = "";//pincode
            TextBox6.Text = "";//address
        }

        //user defined fucntion for checking if member exists
        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM artist_master_table1 WHERE member_id='" + TextBox1.Text.Trim() + "';", con);
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


                //con.Close();
                //Response.Write("<script> alert('Sign Up Successful. Go to User Login to Login'); </script>"); WASTE
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
                return false;
            }
        }
    }
}