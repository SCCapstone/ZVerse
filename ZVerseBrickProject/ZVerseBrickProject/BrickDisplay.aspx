﻿<%@ Page Title="BrickDisplay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrickDisplay.aspx.cs" Inherits="ZVerseBrickProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    #container {
  height: 400px;
  width: 800px;
  position: relative;
}
#image {
  position: absolute;
  left: 0;
  top: 0;
}
#text {
  z-index: 200;
  position: absolute;
  color: black;
  font-size: 24px;
  font-weight: bold;
  left: 300px;
  top: 350px;
}
        </style>
<div id="container">
  <img id="image" src="https://scrapbookoftruthdotnet.files.wordpress.com/2015/03/shutterstock_755319.jpg" />
  <p id="text">
    Alexa Breeland
  </p>
</div>
    </asp:Content>
