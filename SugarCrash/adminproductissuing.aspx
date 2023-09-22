<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminproductissuing.aspx.cs" Inherits="SugarCrash.adminproductissuing" %>

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
                                    <h4>Product Issuing</h4>                                    
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--image-->
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/paints-and-brushes.jpg"/>
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
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Product ID</label>
                                <div class="form-group">
                                    <div class="input-group"> <!--Groups in elements in single line-->
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Product ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>                               
                            </div>

                        </div>
                        
                        <div class="row"> <!--form components 1-->
                            
                            <div class="col-md-6">                               
                                <label>Member Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-6">                               
                                <label>Product Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Product Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div> 

                        </div>

                        <div class="row"> <!--form components 1--> <!--MAIN PAYMENT-->
                            
                            <div class="col-md-6">                               
                                <label>Purchase Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Purchase Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            
                            <!--div class="col-md-6">                               
                                <label>Product Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Product Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            <div--> 

                        </div>

                      
                        <div class="row"> <!--add, update, delete button-->
                            <div class="col">
                                <asp:Button class="btn btn-success btn-lg btn-block" ID="Button2" runat="server" Text="Issue" OnClick="Button2_Click" />
                            </div>

                            <!--div class="col-4">
                                <asp:Button class="btn btn-warning btn-lg btn-block" ID="Button3" runat="server" Text="Update" />
                            <div>

                            <div class="col-4">
                                <asp:Button class="btn btn-danger btn-lg btn-block" ID="Button4" runat="server" Text="Delete" />
                            </div-->
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
                                    <h4>Issued Product List</h4>                                   
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:allureartConnectionString %>" SelectCommand="SELECT * FROM [product_issue_table3]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="product_id" HeaderText="Product ID" SortExpression="product_id" />
                                        <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
                                        <asp:BoundField DataField="purchase_date" HeaderText="Purchased Date" SortExpression="purchase_date" />
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
