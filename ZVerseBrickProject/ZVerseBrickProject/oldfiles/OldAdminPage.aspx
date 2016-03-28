<%@ Page Title="AdminPage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OldAdminPage.aspx.cs" Inherits="ZVerseBrickProject.Admin.AdminPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .toggle-button {
            background-color: white;
            margin: 5px 0;
            border-radius: 20px;
            border: 2px solid #D0D0D0;
            height: 24px;
            cursor: pointer;
            width: 50px;
            position: relative;
            display: inline-block;
            user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
            -moz-user-select: none;
        }

            .toggle-button button {
                cursor: pointer;
                outline: 0;
                display: block;
                position: absolute;
                left: 0;
                top: 0;
                border-radius: 100%;
                width: 30px;
                height: 30px;
                background-color: white;
                float: left;
                margin: -3px 0 0 -3px;
                border: 2px solid #D0D0D0;
                transition: left 0.3s;
            }

        .toggle-button-selected {
            background-color: #83B152;
            border: 2px solid #7DA652;
        }

            .toggle-button-selected button {
                left: 26px;
                top: 0;
                margin: 0;
                border: none;
                width: 24px;
                height: 24px;
                box-shadow: 0 0 4px rgba(0,0,0,0.1);
            }
    </style>
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
    Clicking hide will take the existing model off the Custom Objects and the Tabs.
        <br />
    Click the Update Website button when done with your changes!
        <br />
    <br />

    <asp:ListView ID="bricklist" ItemType="ZVerseBrickProject.Models.Brick" runat="server" SelectMethod="GetBricks">
        <LayoutTemplate>
            <div class="modelistcontainer">
                <ul class="modelist">
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                </ul>
            </div>
        </LayoutTemplate>

        <ItemTemplate>
         
                <p>
                    <a href="TestDisplay.aspx?brickID=<%#:Item.BrickID%>">
                        <img src="../js/<%#:Item.ImagePath%>" width="280" height="210" style="border: none; margin: auto;" />
                    </a>
                </p>
                <p>
                    <a href="TestDisplay.aspx?brickID=<%#:Item.BrickID%>">
                        <%#:Item.BrickName%>
                    </a>
                    &nbsp&nbsp
                    <asp:Button runat="server" ID="Button1" Text="<%#:Item.showhide%>" CommandArgument="<%#:Item.BrickID %>" OnCommand="Show_Click" />
                </p>
     

        </ItemTemplate>
        <ItemSeparatorTemplate></ItemSeparatorTemplate>

    </asp:ListView>

   
    <a class="btn btn-primary" href="/Default.aspx">Update Website</a>


</asp:Content>
