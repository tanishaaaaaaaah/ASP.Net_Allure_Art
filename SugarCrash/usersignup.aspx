﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="SugarCrash.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">



                        <div class="row"> <!--image-->
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/generaluser.png"/>
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--heading-->
                            <div class="col">
                                <center>
                                    <h4>Member Sign Up</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--hr-->
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <div class="row"> <!--form components::row 1-->
                            <div class="col-md-6">

                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                                
                            </div>

                            <div class="col-md-6">
                                
                                <label>Date Of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        

                        <div class="row"> <!--form components::row 2-->
                            <div class="col-md-6">

                                <label>Contact</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact" TextMode="Phone"></asp:TextBox>
                                </div>
                                
                            </div>

                            <div class="col-md-6">
                                
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>

                            </div>
                        </div>

                        
                        <div class="row"> <!--form components::row 3-->
                            
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="select"/>
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra"/>
                                        <asp:ListItem Text="Gujrat" Value="Gujrat"/>
                                        <asp:ListItem Text="Chattisgarh" Value="Chattisgarh"/>
                                        <asp:ListItem Text="Goa" Value="Goa"/>
                                        <asp:ListItem Text="Karnataka" Value="Karnataka"/>
                                    </asp:DropDownList>
                                </div>                                  
                            </div>

                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                                </div>                             
                            </div>

                            <div class="col-md-4">                               
                                <label>Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Pin Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row"> <!--form components::row 4-->
                            <div class="col">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>                              
                            </div>
                        </div>

                        
                        <div class="row"> <!--form components::row 5-->

                            <div class="col-md-6">
                                <label>Username</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Username"></asp:TextBox>
                                </div>                        
                            </div>

                            <div class="col-md-6">                               
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row"> <!--form components::row 5-->
                            <div class="col">                                                            
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                                </div>                               
                            </div>
                        </div>




                    </div>                    
                </div>
                    <br> <a href="homepage.aspx"> << Back to Home </a> <br> <br>
            </div>
        </div>
    </div>

</asp:Content>
