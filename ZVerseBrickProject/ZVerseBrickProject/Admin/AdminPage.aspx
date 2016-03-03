<%@ Page Title="AdminPage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ZVerseBrickProject.Admin.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1>Welcome, Admin!</h1>
    <hr />
    <h3>Manage your models here</h3>

    <div id="uploadForm">
        <p>Upload your javascript file here: </p>
        <asp:FileUpload id="FileUploadControl" runat="server" />
        <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
        <br /><br />
        <asp:Label runat="server" id="StatusLabel" text="" />
    </div>   

    <div class="row">
            <h2>Our current available models include:</h2>
            
            <p>
                <a class="btn btn-default" href="http://zverse.azurewebsites.net/BrickWithText"> BrickModel &raquo;</a>
            </p>
        <p>
            <a class="btn btn-default" href="http://zverse.azurewebsites.net/CubeWeb"> GamecockCube &raquo;</a>
        </p>
          <p>
            <a class="btn btn-default" href="http://zverse.azurewebsites.net/PlaqueWeb"> Plaque &raquo;</a>
        </p>
        </div>

</asp:Content>
