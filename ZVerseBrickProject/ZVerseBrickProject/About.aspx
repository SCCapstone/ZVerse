<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ZVerseBrickProject.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="font:bold 12px verdana"><%: Title %></h2>
    <h3>About This Project</h3>
    <p>
        This website was part of a yearlong Capstone Senior Engineering project.
        </p>
    <p>
        Contributions were made by Alexa Breeland, Sagar Mistry, Ming Wong, Daniel Harper, and Chris Clymer.
        </p>
    <p>
        Check out our github repo to see more! <a class="btn btn-lg" href="https://github.com/SCCapstone/ZVerse">Github Repo &raquo;</a>
    </p>
    

    <h3>ZVerse Contact Information</h3>
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
