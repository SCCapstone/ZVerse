<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ZVerseBrickProject.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>ZVers Contact Page</h3>
    <address>
        1601 Shop Road, Suite K<br />
        Columbia, SC 29201<br />
        <abbr title="Phone">P:</abbr>
        (803) 764-0353
    </address>

    <address>
        <strong>Email:</strong>   <a href="mailto:info@zverse.com">info@zverse.com</a><br />
    </address>
</asp:Content>
