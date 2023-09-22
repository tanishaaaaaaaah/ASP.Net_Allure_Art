<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminartistmanagement.aspx.cs" Inherits="SugarCrash.adminartistmanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
      $(document).ready(function () {
      
          //$(document).ready(function () {
              //$('.table').DataTable();
         // });
      
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
          //$('.table1').DataTable();
      });
    </script>

    <!--script lang="javascript" type="text/javascript">
        function ValidateForm()
        {
            var ArtistUser = document.getElementById("TextBox1").value;
            var ArtistPass = document.getElementById("TextBox2").value;

            if (ArtistUser == "" && ArtistPass == "")
            {
                alert("Username and password is necessary!");
            }
            else if (ArtistUser == "")
            {
                alert("Username is necessary!");
            }
            else if (ArtistPass == "")
            {
                alert("Password is necessary!");
            }
            else if (ArtistUser.length==0)
            {
                alert("Username cannot be blank");
            }
            else if (ArtistPass.length == 0)
            {
                alert("Password cannot be blank");
            }

        }
    </script-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-md-5"> <!--column 1-->
                <div class="card">
                    <div class="card-body">

                      
                        <div class="row"> <!--heading-->
                            <div class="col">
                                <center>
                                    <h4>Artist Details</h4>                                    
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--image-->
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/writer.png"/>
                                </center>
                            </div>
                        </div>

                        <div class="row"> <!--hr-->
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <div class="row"> <!--form components 1-->

                            <div class="col-md-4">
                                <label>Artist ID</label>
                                <div class="form-group">
                                    <div class="input-group"> <!--Groups in elements in single line-->
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click"/>
                                    </div>
                                </div>
                                
                            </div>

                            <div class="col-md-8">                               
                                <label>Artist Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        
                      
                        <div class="row"> <!--add, update, delete button-->
                            <div class="col-4">
                                <asp:Button class="btn btn-success btn-lg btn-block" ID="Button2" runat="server" Text="Add" OnClick="Button2_Click"/>
                            </div>

                            <div class="col-4">
                                <asp:Button class="btn btn-warning btn-lg btn-block" ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button class="btn btn-danger btn-lg btn-block" ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" />
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
                                    <h4>Artist List</h4>                                   
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:allureartConnectionString %>" SelectCommand="SELECT * FROM [artist_master_table1]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="artist_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="artist_id" HeaderText="artist_id" ReadOnly="True" SortExpression="artist_id" />
                                        <asp:BoundField DataField="artist_name" HeaderText="artist_name" SortExpression="artist_name" />
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
