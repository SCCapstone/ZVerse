<%@ Page Title="AdminPage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ZVerseBrickProject.Admin.AdminPage" %>


<asp:Content ID="AdminContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/admin.css" rel="stylesheet" type=" text/css" />
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
    Clicking Hide will take the existing model off the Custom Objects and the Tabs.
    Clicking Remove will delete the entire model from the database.
        <br />
    Click the UpdateModel when you have made edits!
        <br />
    <br />

    <asp:ListView ID="bricklist" ItemType="ZVerseBrickProject.Models.Brick" runat="server" SelectMethod="GetBricks" OnItemCommand="lv_ItemCommand">
<%--        <LayoutTemplate>
            <div class="modelistcontainer">
                <ul class="modelist">
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                </ul>
            </div>
        </LayoutTemplate>--%>

        <ItemTemplate>
            <br />
             <h5>
               <asp:TextBox runat="server" ID="brickid" Text="<%#:Item.BrickID%>" Visible="false"></asp:TextBox>
               <asp:TextBox ID="brickname" Width="280" runat="server" Text="<%#: Item.BrickName %>"></asp:TextBox>
                </h5>
               <p>
                    <a href="../TestDisplay.aspx?brickID=<%#:Item.BrickID%>">
                        <img src="../js/<%#:Item.ImagePath%>" width="280" height="210" style="border: none; margin: auto;" />
                    </a>
                </p>
                <p>
                 Price: $
                 <asp:TextBox ID="brickprice" Width="50" runat="server" Text="<%#: Item.UnitPrice %>" ></asp:TextBox>

                </p>
                <p>
                    <asp:Button runat="server" ID="Button1" Text="<%#:Item.showhide%>" CommandArgument="<%#:Item.BrickID %>" OnCommand="ShowHide" />
                   <asp:Button runat="server" ID="Button2" Text="Remove" CommandArgument="<%#:Item.BrickID %>" OnCommand="RemoveBrick" />
                    <asp:Button runat="server" ID="Button3" Text="UpdateModel" CommandName="testbrick" CommandArgument="<%# Container.DataItemIndex %>" />
                </p>
        </ItemTemplate>
        <ItemSeparatorTemplate></ItemSeparatorTemplate>

    </asp:ListView>

    <br />


</asp:Content>
