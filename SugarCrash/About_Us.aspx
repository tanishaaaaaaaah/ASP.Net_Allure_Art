<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About_Us.aspx.cs" Inherits="SugarCrash.About_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <section>
        <img src="images\cartoon1.jpg" width="100%" class="img-fluid"/>
    </section>
           
           <div class="row"> <%--NEW ROW--%>
            <div class="col-md-6"> <%--image 1--%>
               <center>
                   <br/>
                   <br/>
                  <img class="rounded-circle" width="200px" height="200px" src="images/user_about_us.jpg"/>
                  <h3>Admin</h3>
                  <p>An art enthusiast with mind painted in monochrome.</p>
                   <p>Contact: 9167372020</p>
                   Instagram: <a href="https://www.instagram.com/tanishaaaaaaaah/">Tanisha</a>
               </center>
            </div>

               <div class="col-md-6"> <%--image 2--%>
               <center>
                   <br/>
                   <br />                  
                  <img class="rounded-circle" width="200px" height="200px" src="images/mates.jpg"/>
                  <h3>Team</h3>
                  <p>We're a team who has contributed a lot in art and would like to share it with you!</p>
                   Instagrams:
                   <a href="https://www.instagram.com/che2uuuuu_917/">Chetana</a>
                   <a href="https://www.instagram.com/shra0103/">Shraddha</a>
                   <a href="https://www.instagram.com/avinashrana_0910/">Avinash</a>
               </center>
            </div>
</asp:Content>
