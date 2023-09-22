<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminproductinventory.aspx.cs" Inherits="SugarCrash.adminproductinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">

      <div class="row">
         <div class="col-md-5">

            <div class="card">
               <div class="card-body">

                  <div class="row"> <!---->
                     <div class="col">
                        <center>
                           <h4>Product Details</h4>
                        </center>
                     </div>
                  </div>

                  <div class="row"> <!---->
                     <div class="col">
                        <center>
                           <img id="imgview" Height="150px" Width="150px" src="images/product-details.jpg" />
                        </center>
                     </div>
                  </div>

                  <div class="row"> <!---->
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <div class="row"> <!---->
                     <div class="col">
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                     </div>
                  </div>

                   <br>

                  <div class="row"> <!---->


                     <div class="col-md-3"> <!---->
                        <label>Product ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>

                     <div class="col-md-9">
                        <label>Product Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Product Name"></asp:TextBox>
                        </div>
                     </div>

                  </div>


                  <div class="row"> <!---->
                    
                     <div class="col-md-6"> <!--inner sub block 1-->

                        <label>Artist Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                              <asp:ListItem Text="a1" Value="a1" />
                              <asp:ListItem Text="a2" Value="a2" />
                           </asp:DropDownList>
                        </div>

                        <label>Created Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                        </div>

                     </div>

                     <div class="col-md-6"> <!--inner sub block 2-->
                        <label>Genre</label>
                        <div class="form-group">
                           <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="4">                            
                               <asp:ListItem Text="Anime Poster" Value="Anime Poster" />
                               <asp:ListItem Text="Anime Sketches" Value="Anime Sketches" />
                               <asp:ListItem Text="Posters" Value="Posters" />
                               <asp:ListItem Text="Mandala Art" Value="Mandala Art" />
                               <asp:ListItem Text="French series" Value="French series" />
                               <asp:ListItem Text="Sketches" Value="Sketches" />
                               <asp:ListItem Text="Canvases" Value="Canvases" />
                           </asp:ListBox>
                        </div>
                     </div>

                  </div>


                  <div class="row">     <!----> 
                      
                     <div class="col-md-4">
                        <label>Cost</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Cost" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>     
                      
                      <div class="col-md-4">
                        <label>Actual Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Actual" TextMode="Number"></asp:TextBox>
                        </div>
                      </div>

                      <div class="col-md-4">
                        <label>Current Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Current" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                      
                  </div>

                  
                  <div class="row">  <!---->
                     <div class="col-12">
                        <label>Product Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Product Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">  <!---->
                     <div class="col-4">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" />
                     </div>
                  </div>


               </div>
            </div>
            <a href="homepage.aspx"> << Back to Home</a><br>
            <br>
         </div>




         <div class="col-md-7">

            <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Product Inventory List</h4>
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
      </div>
   </div>

</asp:Content>
