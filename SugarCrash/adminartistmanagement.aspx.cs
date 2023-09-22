using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SugarCrash
{

    public partial class adminartistmanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind(); //connect to db and get new fresh data
        }

        protected void Button2_Click(object sender, EventArgs e) // Add button click
        {
            if (checkIfArtistExists())
            {
                Response.Write("<script> alert('Artist with same ID already exists. Please try again with another ID'); </script>");
            }
            else
            {
                addNewArtist();
            }
        }

        protected void Button3_Click(object sender, EventArgs e) // Update button click
        {
            if (checkIfArtistExists())
            {
                updateArtist();
            }
            else
            {
                Response.Write("<script> alert('Artist does not exist!'); </script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e) // Delete button click
        {
            if (checkIfArtistExists())
            {
                deleteArtist();
            }
            else
            {
                Response.Write("<script> alert('Artist does not exist!'); </script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e) // Go button click
        {
            getArtistByID();
        }

        //user defined method to check if artist exists
        bool checkIfArtistExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM artist_master_table1 WHERE artist_id='" + TextBox1.Text.Trim() + "';", con);
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

        //user define function AddArtist
        void addNewArtist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO artist_master_table1 (artist_id, artist_name) values (@artist_id, @artist_name)", con);
                cmd.Parameters.AddWithValue("@artist_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@artist_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Artist Added Successfully'); </script>");
                clearForm();
                GridView1.DataBind(); //connect to db and get new fresh data

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        //user defined function to UpdateArtist
        void updateArtist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE artist_master_table1 SET artist_name = @artist_name WHERE artist_id = '" + TextBox1.Text.Trim() + "' ", con);
                cmd.Parameters.AddWithValue("@artist_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@artist_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Artist Updated Successfully'); </script>");
                clearForm();
                GridView1.DataBind(); //connect to db and get new fresh data

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        //user defined function to DeleteArtist
        void deleteArtist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM artist_master_table1 WHERE artist_id = '" + TextBox1.Text.Trim() + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Artist Deleted Successfully'); </script>");
                clearForm();
                GridView1.DataBind(); //connect to db and get new fresh data

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        //user defined function to fetch data of GO
        void getArtistByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM artist_master_table1 WHERE artist_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd); //this will keep the connection open even aftert he query is fired else usually the connection closes after query is fired.
                System.Data.DataTable dt = new System.Data.DataTable(); //temporary for showing data in table format
                da.Fill(dt); //fills the username from the db into the table

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Artist ID');</script>");
                }
                //con.Close();
                //Response.Write("<script> alert('Sign Up Successful. Go to User Login to Login'); </script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");             
            }
        }


        //user defined function to clear form
        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }



    }
}