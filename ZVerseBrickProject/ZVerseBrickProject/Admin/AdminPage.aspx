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
  


   
        <h3>Our current available models include:</h3>
        Clicking hide will take the existing model off the BrickCatalogue and the Tabs. <br />
        You must click to another page to see the changes. <br /> <br />
         <asp:ListView ID="bricklist" ItemType="ZVerseBrickProject.Models.Brick" runat="server" SelectMethod="GetBricks">
             <ItemTemplate>
                 <p>
                     <a class="btn btn-default" href="/TestDisplay2.aspx?brickID=<%#:Item.BrickID%>">
                         <%#:Item.BrickName %>
                     </a>
                     &nbsp&nbsp
                                <asp:Button runat="server" ID="Show" Text="Show" CommandArgument="<%#:Item.BrickID %>" OnCommand="Show_Click" />
                     <asp:Button runat="server" ID="Hide" Text="Hide" CommandArgument="<%#:Item.BrickID %>" OnCommand="Hide_Click" />
                 </p>
             </ItemTemplate>
             <ItemSeparatorTemplate>&nbsp&nbsp</ItemSeparatorTemplate>
         </asp:ListView>
  

          </div>
</asp:Content>
