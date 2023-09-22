using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SugarCrash
{
    public partial class adminproductissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Go button blue
        protected void Button1_Click(object sender, EventArgs e)
        {
            getNames();
        }

        //issue button green
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfProductExist() && checkIfMemberExist())
            {

                issueProduct();
                /*if (checkIfIssueEntryExist())
                {
                    Response.Write("<script>alert('This Member already has this book');</script>");
                }
                else
                {
                    issueBook();
                }*/

            }
            else
            {
                Response.Write("<script>alert('Wrong Product ID or Member ID');</script>");
            }
        }

        //USER DEFINED FUNCTION for getNames()
        void getNames()
        {           
                //creating connection
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                //sql command QUERY1
                SqlCommand cmd = new SqlCommand("SELECT product_name FROM product_master_table5 WHERE product_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0]["product_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Product ID');</script>");
                }

                //Query2
                cmd = new SqlCommand("SELECT full_name from member_management_table4 WHERE member_id='" + TextBox2.Text.Trim() + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong User ID');</script>");
                }                     
        }


        //USER DEFINED FUNCTION for checkIfProductExist()
        bool checkIfProductExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM product_master_table5 WHERE product_id='" + TextBox1.Text.Trim() + "' AND current_stock >0", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        //USER DEFINED FUNCTION for checkIfMemberExist()
        bool checkIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT full_name from member_management_table4 WHERE member_id='" + TextBox2.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }


        //USER DEFINED FUNCTION FOR issueProduct()
        void issueProduct()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO product_issue_table3(member_id,member_name,product_id,product_name,purchase_date) values(@member_id,@member_name,@product_id,@product_name,@purchase_date)", con);
              
                cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@product_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@product_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@purchase_date", TextBox5.Text.Trim());              
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE product_master_table5 SET current_stock = current_stock-1 WHERE product_id='" + TextBox1.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Product Issued Successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}