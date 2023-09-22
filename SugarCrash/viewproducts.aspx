<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewproducts.aspx.cs" Inherits="SugarCrash.viewproducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container"> <%--gridview to display products --%>

                        <div class="row"> <!--heading-->
                            <div class="col">
                                <center>
                                    <h4>View Products List</h4>                                    
                                </center>
                            </div>
                        </div>



                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>

        <br/>

          <div class="row">
              
                   <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Our Products!</h4>
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:allureartConnectionString %>" SelectCommand="SELECT * FROM [product_master_table5]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="product_id" HeaderText="ID" ReadOnly="True" SortExpression="product_id" >
                                


                                <ControlStyle Font-Bold="True" />
                                </asp:BoundField>
                                


                                <asp:TemplateField>
                                    <ItemTemplate>
                                        
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">

                                                    <div class="row"> <!--Row 1 :Name of the product:-->
                                                        <div class="col-lg-10">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("product_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row"> <!--Row 2-->
                                                        <div class="col-lg-10">
                                                            Artist -
                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("artist_name") %>'></asp:Label>
                                                            &nbsp;| Genre -
                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row"> <!--Row 3-->
                                                        <div class="col-lg-10">
                                                            Created date -
                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("created_date") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row"> <!--Row 4-->
                                                        <div class="col-lg-10">
                                                            Cost -
                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("product_cost") %>'></asp:Label>
                                                            &nbsp;| Available Stock -
                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row"> <!--Row 5-->
                                                        <div class="col-lg-10">
                                                            Product description -
                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("product_description") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row"> <!--Row 6-->
                                                        <div class="col-lg-10">
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="col-lg-2">
                                                    <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("product_image_link") %>' />  <!--image in the column 2-->
                                                </div>
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                


                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>

               </div>
            </div>
              
          </div>

        <a href="homepage.aspx"> << Back to Home </a> <br><br>
    </div>
</asp:Content>