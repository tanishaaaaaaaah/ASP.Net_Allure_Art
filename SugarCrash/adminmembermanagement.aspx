﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="SugarCrash.adminmembermanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">

            <div class="col-md-5"> <!--column 1-->
                <div class="card">
                    <div class="card-body">

                      
                        <div class="row"> <!--heading-->
                            <div class="col">
                                <center>
                                    <h4>Member Details</h4>                                    
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--image-->
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/generaluser.png"/>
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--hr-->
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <div class="row"> <!--form components 1-->

                            <div class="col-md-3">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <div class="input-group"> <!--Groups in elements in single line-->
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary mr-1" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                                </div>                               
                            </div>
                            
                            <div class="col-md-4">                               
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">                               
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group"> <!--Groups in elements in single line-->
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>                          
                        </div>
                        
                        <div class="row"> <!--form components 1-->

                            <div class="col-md-3">                               
                                <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">                               
                                <label>Contact</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contact" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-5">                               
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div> 

                        </div>


                        <div class="row"> <!--form components 1-->

                            <div class="col-md-4">                               
                                <label>State</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">                               
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">                               
                                <label>Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Pin Code" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div> 

                        </div>



                        <div class="row"> <!--form components 1--> <!--MAIN PAYMENT-->
                            
                            <div class="col-12">                               
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>                                                      
                        </div>

                      
                        <div class="row"> <!--add, update, delete button-->
                            <div class="col">
                                <asp:Button class="btn btn-danger btn-lg btn-block" ID="Button5" runat="server" Text="Delete User" OnClick="Button5_Click" />
                            </div>                        
                        </div>


                    </div>                   
                </div>
                    <a href="homepage.aspx"> << Back to Home </a> <br><br>
            </div>


            <div class="col-md-7"> <!--column 2-->
                <div class="card">
                    <div class="card-body">
                       

                        <div class="row"> <!--header-->
                            <div class="col">
                                <center>
                                    <h4>Member List</h4>                                   
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--hr-->
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <!--Grid view-->
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:allureartConnectionString %>" SelectCommand="SELECT * FROM [member_management_table4]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>                       
                    </div>                   
                </div>
            </div>

        </div>
    </div>

</asp:Content>
