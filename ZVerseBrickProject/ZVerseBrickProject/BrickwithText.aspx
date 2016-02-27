<%@ Page Title="Brick with Text" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrickwithText.aspx.cs" Inherits="ZVerseBrickProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!-----------------------------------------------------------------------------
Name: BrickwithText.aspx
Description: This file creates the brick with text view. It create three text
    boxes in the main body, and a 3D window with a pre-rendered polygon. Once
    the user enters text into a text box, the text will appear on the brick as 
    the text is written in the box. 
Input Parameters: No formal input from the system, but does take in the string
    inputs from the user
Output Parameters: Passes the user input from the text box to external 
    JavaScript via function calls.
------------------------------------------------------------------------------> 

    <html lang="en">
    <head>
        <!--this file does...-->
        <script src="js/threex.dynamictexture.js"></script>
        
        <!--this file does...-->
        <script src="js/three.min.js"></script>
        
        <!--Containing file for brick and text rendering functions-->
        <script src="js/newBrickRendering.js"></script>
    </head>
    <body>
        <!--Top line text box, calls getText1() in newBrickRendering.js on key press or key up-->
        <div class="textBoxLine">
            <asp:Label AssociatedControlID="textbox1">Top Text Line:
                <asp:TextBox ID="textBox1" runat="server" MaxLength="40" placeholder="text line 1" onKeyPress ="getText1(this.value)" onKeyUp = "getText1(this.value)"></asp:TextBox>
            </asp:Label>
        </div>

        <br /><br />

        <!--Middle line text box, calls getText2() in newBrickRendering.js on key press or key up-->
        <div class="textBoxLine">
            <asp:Label AssociatedControlID="textbox2">Middle Text Line:
                <asp:TextBox ID="textBox2" runat="server" MaxLength="40" placeholder="text line 2" onKeyPress ="getText2(this.value)" onKeyUp = "getText2(this.value)"></asp:TextBox>
            </asp:Label>
        </div>

        <br /><br />

        <!--Bottom line text box, calls getText2() in newBrickRendering.js on key press or key up-->
        <div class="textBoxLine">
            <asp:Label AssociatedControlID="textbox3">Bottom Text Line:
                <asp:TextBox ID="textBox3" runat="server" MaxLength="40" placeholder="text line 3" onKeyPress ="getText3(this.value)" onKeyUp = "getText3(this.value)"></asp:TextBox>
            </asp:Label>
        </div>

    </body>
    </html>


</asp:Content>
