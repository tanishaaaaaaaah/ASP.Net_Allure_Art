<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="SugarCrash.userprofile" %>

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
                                    <h4>Your Profile</h4>
                                    <span>Account Status: </span>
                                    <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Your Status"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--hr-->
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row"> <!--form components 1-->

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
                        
                        <div class="row"> <!--form components 2-->

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

                        
                        <div class="row"> <!--form components 3-->

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


                        <div class="row"> <!--form components 4-->
                            <div class="col">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>                             
                            </div>
                        </div>

                        
                        <div class="row"> <!--form components 5-->

                            <div class="col-md-4">
                                <label>Username</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Username" ReadOnly="True"></asp:TextBox>
                                </div>                              
                            </div>

                            <div class="col-md-4">                              
                                <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">                               
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row"> <!--update button-->
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                                    </div>
                                </center>
                            </div>
                        </div>


                    </div>                   
                </div>
                    <a href="homepage.aspx"> << Back to Home </a> <br><br>
            </div>






            <div class="col-md-7"> <!--column 2-->
                <div class="card">
                    <div class="card-body">

                        <div class="row"> <!--image-->
                            <div class="col">
                                <center>
                                    <img width="110px" src="images/hand-palm.jpg"/>
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--header-->
                            <div class="col">
                                <center>
                                    <h4>Issued Products</h4>                                   
                                    <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Your Product Info"></asp:Label>
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
                            <div class="col">
                                <asp:GridView class="table table-striped" ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>                       
                    </div>                   
                </div>
            </div>

        </div>
    </div>


</asp:Content>
