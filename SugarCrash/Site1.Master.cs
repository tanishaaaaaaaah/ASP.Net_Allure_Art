using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SugarCrash
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try 
            {
                if (Session["role"] == null) //if NO USER has logged in:: not admin or user
                {
                    LinkButton1.Visible = true; //user login link button ::header
                    LinkButton2.Visible = true; //sign up link button ::header
                    LinkButton6.Visible = true; //admin login ::footer         

                    LinkButton3.Visible = false; //logout link button ::header
                    LinkButton7.Visible = false; //hello user link button ::header
                    LinkButton11.Visible = false; //artist management link button ::footer
                    LinkButton8.Visible = false; //product inventory link button ::footer
                    LinkButton9.Visible = false; //issue product link button ::footer
                    LinkButton10.Visible = false; //member management link button ::footer
                }
                else if(Session["role"].Equals("user")) //if ONE USER has logged in
                {
                    LinkButton1.Visible = false; //user login link button ::header
                    LinkButton2.Visible = false; //sign up link button ::header
                    LinkButton6.Visible = true; //admin login ::footer         

                    LinkButton3.Visible = true; //logout link button ::header
                    LinkButton7.Visible = true; //hello user link button ::header
                    LinkButton7.Text = "Hi " + Session["username"].ToString();

                    LinkButton11.Visible = false; //artist management link button ::footer
                    LinkButton8.Visible = false; //product inventory link button ::footer
                    LinkButton9.Visible = false; //issue product link button ::footer
                    LinkButton10.Visible = false; //member management link button ::footer
                }
                else if (Session["role"].Equals("admin")) //if ADMIN has logged in
                {
                    LinkButton1.Visible = false; //user login link button ::header
                    LinkButton2.Visible = false; //sign up link button ::header
                    LinkButton6.Visible = false; //admin login ::footer         

                    LinkButton3.Visible = true; //logout link button ::header
                    LinkButton7.Visible = true; //hello user link button ::header
                    LinkButton7.Text = "Hi Admin";

                    LinkButton11.Visible = true; //artist management link button ::footer
                    LinkButton8.Visible = true; //product inventory link button ::footer
                    LinkButton9.Visible = true; //issue product link button ::footer
                    LinkButton10.Visible = true; //member management link button ::footer
                    LinkButton5.Visible = true; //print report link button ::footer
                }
            }
            catch(Exception ex)
            {
                
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e) //Admin- admin login
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e) //Admin- Artist Management
        {
            Response.Redirect("adminartistmanagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e) //Admin- Product Inventory
        {
            Response.Redirect("adminproductinventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e) //Admin- Product Issuing
        {
            Response.Redirect("adminproductissuing.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e) // Admin- Member Management
        {
            Response.Redirect("adminmembermanagement.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e) //view products
        {
            Response.Redirect("viewproducts.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e) //User login
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e) //user sign up
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e) //logout button
        {
            Session["username"] = ""; //fetch data and keep in sessions because the browser refreshes everytime
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true; //user login link button ::header DEFAULT VIEW
            LinkButton2.Visible = true; //sign up link button ::header
            LinkButton6.Visible = true; //admin login ::footer         

            LinkButton3.Visible = false; //logout link button ::header
            LinkButton7.Visible = false; //hello user link button ::header
            LinkButton11.Visible = false; //artist management link button ::footer
            LinkButton8.Visible = false; //product inventory link button ::footer
            LinkButton9.Visible = false; //issue product link button ::footer
            LinkButton10.Visible = false; //member management link button ::footer

            Response.Redirect("homepage.aspx");

            
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Report.aspx");
        }
    }
}