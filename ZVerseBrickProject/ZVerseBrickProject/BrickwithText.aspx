<%@ Page Title="Brick with Text" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrickwithText.aspx.cs" Inherits="ZVerseBrickProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 

    <html lang="en">
    <head>
        <script src="js/threex.dynamictexture.js"></script>
        <script src="js/three.min.js"></script>
        <script src="js/newBrickRendering.js"></script>
        <br />
        <p>
            May need to hit enter to have your text render on the brick
        </p>
    </head>
    <body>
        
        <div class="textBoxLine">
            <asp:Label AssociatedControlID="textbox1">Top Text Line:
                <asp:TextBox ID="textBox1" runat="server" MaxLength="40" placeholder="text line 1" onKeyPress ="getText1(this.value)" onKeyUp = "getText1(this.value)"></asp:TextBox>
            </asp:Label>
        </div>
        <br /><br />
        <div class="textBoxLine">
            <asp:Label AssociatedControlID="textbox2">Middle Text Line:
                <asp:TextBox ID="textBox2" runat="server" MaxLength="40" placeholder="text line 2" onKeyPress ="getText2(this.value)" onKeyUp = "getText2(this.value)"></asp:TextBox>
            </asp:Label>
        </div>
        <br /><br />
        <div class="textBoxLine">
            <asp:Label AssociatedControlID="textbox3">Bottom Text Line:
                <asp:TextBox ID="textBox3" runat="server" MaxLength="40" placeholder="text line 3" onKeyPress ="getText3(this.value)" onKeyUp = "getText3(this.value)"></asp:TextBox>
            </asp:Label>
        </div>

    </body>
    </html>


</asp:Content>
