using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace SugarCrash
{
    public partial class adminproductinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock;
        protected void Page_Load(object sender, EventArgs e)
        {
            //FillArtistValues();
            //GridView1.DataBind();
            if (!IsPostBack)
            {
                FillArtistValues();
            }

            GridView1.DataBind();
        }

        //GO button click :: Blue
        protected void LinkButton4_Click(object sender, EventArgs e) 
        {
            getProductByID();
        }

        //Add button click :: Green
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfProductExists())
            {
                Response.Write("<script> alert('Product already exists! Recheck Product ID!'); </script>");
            }
            else 
            {
                addNewProduct();
            }
        }

        //UPDATE button click :: Yellow
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateProductByID();
        }

        //DELETE button click :: Red
        protected void Button2_Click(object sender, EventArgs e)
        {
            DeleteProductByID();
        }

        //USER DEFINED FUNCTION FillArtistValues
        void FillArtistValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT artist_name FROM artist_master_table1", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd); //disconnected architecture
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "artist_name";
                DropDownList3.DataBind();
                
            }
            catch (Exception ex)
            { 

            }
        }

        //USER DEFINED FUNCTION CheckIfProductExist
        bool checkIfProductExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM product_master_table5 where product_id ='" + TextBox1.Text.Trim() + "' OR product_name ='" + TextBox2.Text.Trim() + "';", con);
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

        //USER DEFINED FUNCTION AddNewProduct
        void addNewProduct()
        {
            try
            {
                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                // genres = skies, mandala, canvas, nature, 
                genres = genres.Remove(genres.Length - 1); //to remove the extra comma from the end of the genre list


                string filepath = "~/product_inventory/product-details.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("product_inventory/" + filename));
                filepath = "~/product_inventory/" + filename;



                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO product_master_table5 (product_id,product_name,genre,artist_name,created_date,product_cost,actual_stock,current_stock,product_description,product_image_link) values(@product_id,@product_name,@genre,@artist_name,@created_date,@product_cost,@actual_stock,@current_stock,@product_description,@product_image_link)", con);

                cmd.Parameters.AddWithValue("@product_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@product_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@artist_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@created_date", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@product_cost", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@product_description", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@product_image_link", filepath);
                
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product added successfully!');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //USER DEFINED FUNCTION getBookByID
        void getProductByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM product_master_table5 WHERE product_id = '"+ TextBox1.Text.Trim()+"'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd); //disconnected architecture
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataBind(); //

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["product_name"].ToString(); //working
                    DropDownList3.SelectedValue = dt.Rows[0]["artist_name"].ToString().Trim(); 
                    TextBox10.Text = dt.Rows[0]["product_cost"].ToString().Trim();                  
                    TextBox4.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["product_description"].ToString();

                    //Genre ListBox
                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }
                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());               
                    global_filepath = dt.Rows[0]["product_image_link"].ToString();

                    GridView1.DataBind();
                }
                else 
                {
                    Response.Write("<script>alert('Invalid Product ID');</script>");
                }
            }
            catch (Exception ex)
            {

            }
        }

        //USer defined function for checkIfProductExists
        /*void checkIfProductExists()
        {
            
        }*/


        //USER DEFINED FUNCTION FOR updateProductByID
        void updateProductByID()
        {
            if (checkIfProductExists())
            {
                try
                {

                    //int actual_stock = Convert.ToInt32(TextBox4.Text.Trim());
                    //int current_stock = Convert.ToInt32(TextBox5.Text.Trim());



                    string genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/product_inventory/product-details.jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath; //if the file name isnt updated then it will choose the old file path that is tored in global variable.
                    }
                    else //if the file path is updated
                    {
                        FileUpload1.SaveAs(Server.MapPath("product_inventory/" + filename));
                        filepath = "~/product_inventory/" + filename;
                    }




                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE product_master_table5 SET product_name=@product_name, genre=@genre, artist_name=@artist_name, created_date=@created_date, product_cost=@product_cost, product_description=@product_description, actual_stock=@actual_stock, current_stock=@current_stock, product_image_link=@product_image_link WHERE product_id='" + TextBox1.Text.Trim() + "'", con);
                    GridView1.DataBind();

                    cmd.Parameters.AddWithValue("@product_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@artist_name", DropDownList3.SelectedItem.Value);                   
                    cmd.Parameters.AddWithValue("@created_date", TextBox3.Text.Trim());                  
                    cmd.Parameters.AddWithValue("@product_cost", TextBox10.Text.ToString().Trim());
                    cmd.Parameters.AddWithValue("@product_description", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", TextBox4.ToString()); //txt4
                    cmd.Parameters.AddWithValue("@current_stock", TextBox5.ToString()); //txt5
                    cmd.Parameters.AddWithValue("@product_image_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Product updated Succesfully!');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else 
            {
                //Response.Write("<script>alert('EOF');</script>");
            }
        }

        //USER DEFINED FUNCTION for deleteBookByID
        void DeleteProductByID()
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
                    SqlCommand cmd = new SqlCommand("DELETE FROM product_master_table5  WHERE product_id='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Product deleted successfully!');</script>");                  
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        //user defined function to clear form
        /*void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }*/
    }
}