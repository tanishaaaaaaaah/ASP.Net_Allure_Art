<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="SugarCrash.Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <section>
        <img src="images/bg2.jpg" class="img-fluid"/>
    </section>


        <div>
            <center>
            <asp:Panel ID="panelPDF" runat="server">
                <asp:GridView ID="gridviewData" runat="server">

                </asp:GridView>
            </asp:Panel>        


                </center>
            <br/> <br/>

            <center>
                        <div class="row"> <!--update button-->
                            <div class="col-8 mx-auto">
                                
                                    <div class="form-group">
                                        <asp:Button  ID="Button1"  runat="server" Text="Print" OnClick="Button1_Click" />
                                    </div>
                                
                            </div>
                        </div>
                </center>
            <br/>
            <h3><center><a href="homepage.aspx"> Back to HomePage </a></center><h3>
        </div>
    </form>
</body>
</html>
