<%@ Page Title="AdminPage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ZVerseBrickProject.Admin.AdminPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Welcome, Admin!</h1>
    <hr />
    <h3>Manage your models here</h3>
    <br />

    <div id="uploadForm">
        <br />
        <p>Upload your javascript file here: </p>
        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
        <br />
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text="" />
    </div>


    <div class="row">
        <h2>Our current available models include:</h2>

        <p>
            <a class="btn btn-default" href="http://zverse.azurewebsites.net/BrickWithText">BrickModel &raquo;</a>
            <asp:Button runat="server" ID="Show5" Text="Show" OnClick="Show5_Click" />
            <asp:Button runat="server" ID="Hide5" Text="Hide" OnClick="Hide5_Click" />
        </p>
        <p>
            <a class="btn btn-default" href="http://zverse.azurewebsites.net/CubeWeb">GamecockCube &raquo;</a>
            <asp:Button runat="server" ID="Show6" Text="Show" OnClick="Show6_Click" />
            <asp:Button runat="server" ID="Hide6" Text="Hide" OnClick="Hide6_Click" />
        </p>
        <p>
            <a class="btn btn-default" href="http://zverse.azurewebsites.net/PlaqueWeb">Plaque &raquo;</a>
            <asp:Button runat="server" ID="Show7" Text="Show" OnClick="Show7_Click" />
            <asp:Button runat="server" ID="Hide7" Text="Hide" OnClick="Hide7_Click" />
        </p>
    </div>

</asp:Content>
