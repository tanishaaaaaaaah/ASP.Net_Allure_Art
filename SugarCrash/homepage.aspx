<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="SugarCrash.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--bg line 1--%>
    <section>
        <img src="images/bg3.jpg" class="img-fluid"/>
    </section>

    
    <%--Row1 columns=3 Primary features--%>
    <section>
      <div class="container"> <%--Container 1--%>
         <div class="row">

            <div class="col-12"> <%--Heading 1--%>
               <center>
                  <h2>Our Features</h2>
                  <p><b>Our 3 Primary Features</b></p>
               </center>
            </div>
         </div>

         <div class="row"> <%--NEW ROW--%>
            <div class="col-md-4"> <%--image 1--%>
               <center>
                  <img width="150px" src="images/digital-inventory.png"/>
                  <h4>Digital Inventory</h4>
                  <p class="text-justify">Digital Inventory enables the user to comfortably go through the products and know its respective specifications about it if needed.</p>
                   <p>:D</p>
               </center>
            </div>

            <div class="col-md-4"> <%--image 2--%>
               <center>
                  <img width="150px" src="images/search-online.png"/>
                  <h4>Search Products</h4>
                  <p class="text-justify">User can search products as per their requirements using filters to make search easier.</p>
                   <p>:/</p>
               </center>
            </div>

            <div class="col-md-4"> <%--image 3--%>
               <center>
                  <img width="150px" src="images/book-online.png"/>
                  <h4>Issue Online</h4>
                  <p class="text-justify">User can get their desired product issued online and can view their own inventory of issued products. Its good to be aware of your own wishes.</p>
                  <p>^_^</p>
               </center>
            </div>

         </div>
      </div>
   </section>

    
    <%--bg line 2--%>
    <section>
        <img src="images/bg2.jpg" class="img-fluid"/>
    </section>


    <%--Row2 columns=3 What's the process?--%>
    <section>
      <div class="container"> <%--Container 2--%>
         <div class="row">

            <div class="col-12"> <%--Heading 2--%>
               <center>
                  <h2>What's the process?</h2>
                  <p><b>3 Simple Step Process</b></p>
               </center>
            </div>
         </div>

         <div class="row"> <%--NEW ROW--%>
            <div class="col-md-4"> <%--image 1--%>
               <center>
                  <img width="150px" src="images/sign-up.png" />
                  <h4>Sign Up</h4>
                  <p class="text-justify">Sign up to have everthing organised in your account.</p>
               </center>
            </div>

            <div class="col-md-4"> <%--image 2--%>
               <center>
                  <img width="150px" src="images/search-online.png"/>
                  <h4>Search Products</h4>
                  <p class="text-justify"> <center> Search for desired products online. </center> </p>
               </center>
            </div>

            <div class="col-md-4"> <%--image 3--%>
               <center>
                  <img width="150px" src="images/library.png"/>
                  <h4>Visit Us</h4>
                  <p class="text-justify">Issue the products online by calling the contact on About page for normal and custom made products.</p>
               </center>
            </div>

         </div>
      </div>
   </section>
</asp:Content>
