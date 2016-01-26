<%@ Page Title="BrickDisplay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrickDisplay.aspx.cs" Inherits="ZVerseBrickProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    #container {
  height: 400px;
  width: 400px;
  position: relative;
}
#image {
  position: absolute;
  left: 0;
  top: 0;
}
#text {
  z-index: 100;
  position: absolute;
  color: white;
  font-size: 24px;
  font-weight: bold;
  left: 150px;
  top: 350px;
}
        </style>
<div id="container">
  <img id="image" src="http://www.noao.edu/image_gallery/images/d4/androa.jpg" />
  <p id="text">
    Hello World!
  </p>
</div>
    </asp:Content>
