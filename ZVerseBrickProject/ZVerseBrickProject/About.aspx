<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ZVerseBrickProject.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    
    <h3 style="color:orangered">About This Project</h3>
    
    <p>
        This website was part of a yearlong Capstone Senior Engineering project.
        </p>
    <p>
        Contributions were made by Alexa Breeland, Sagar Mistry, Ming Wong, Daniel Harper, and Chris Clymer.
        </p>
    <p>
        <a class="btn btn-lg" href="https://github.com/SCCapstone/ZVerse">Check out our github repo to see more! &raquo;</a>
    </p>
            
    <div class="boxed">
    <h3 style="color:orangered">ZVerse Contact Information</h3>
    <address>
        1601 Shop Road, Suite K<br />
        Columbia, SC 29201<br />
        <abbr title="Phone">P:</abbr>
        (803) 764-0353
    </address>

    <address>
        <strong>Email:</strong>   <a href="mailto:info@zverse.com">info@zverse.com</a><br />
    </address>
        </div>
    <style>
    .boxed {
  border-top: 1px solid black ;
}
    h3 {text-align:center; }
    p {text-align:center;}
    address {text-align:center;}
</style>
</asp:Content>
