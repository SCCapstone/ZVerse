<%@ Page Title="AdminPage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ZVerseBrickProject.Admin.AdminPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Welcome, Admin!</h1>
    <hr />
    <h3>Manage your models here</h3>


    <div id="uploadForm">
        <br />
        <p>Upload your javascript file here: </p>
        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
        <br />
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text="" />
  
         </div>

   
        <h3>Our current available models include:</h3>
        Clicking hide will take the existing model off the Custom Objects and the Tabs. <br />
        Click the Update Website button when done with your changes! <br /> <br />
        <asp:ListView ID="bricklist" ItemType="ZVerseBrickProject.Models.Brick" runat="server" SelectMethod="GetBricks">
            <ItemTemplate>
                <p>
                    <a href="/TestDisplay.aspx?brickID=<%#:Item.BrickID%>">
                        <%#:Item.BrickName %>
                    </a>
                    <%-- <img src="<%#:Item.ImagePath%>">;--%>
                    <%--  &nbsp&nbsp
                                 <asp:Button runat="server" ID="Show" Text="Show" CommandArgument="<%#:Item.BrickID %>" OnCommand="Show_Click" />
                    <asp:Button runat="server" ID="Hide" Text="Hide" CommandArgument="<%#:Item.BrickID %>" OnCommand="Hide_Click" />--%>
                    <script type="text/javascript">
                        function toggle(button)
                        {
                            if(document.getElementById("1").value=="Hiding"){
                                document.getElementById("1").value = "Showing";
                                //Hide_Click(<%#:Item.BrickID %>);
                            }
                            else if (document.getElementById("1").value == "Showing") {
                                document.getElementById("1").value = "Hiding";
                            }
                        }
                    </script>

                    <html>
                        <body>
                            <form action="AdminPage.aspx">
                                <input type="button" id="1" value="Showing" style="color:blue"
                                    onclick="toggle(this); ">
                            </form>
                        </body>
                    </html>
   
                </p>
            </ItemTemplate>
            <ItemSeparatorTemplate>&nbsp&nbsp</ItemSeparatorTemplate>
        </asp:ListView>
    <br />
        <a class="btn btn-primary" href="/Default.aspx">Update Website</a>
          


</asp:Content>




