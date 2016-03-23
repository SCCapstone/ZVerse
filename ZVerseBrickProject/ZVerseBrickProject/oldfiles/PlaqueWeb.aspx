<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlaqueWeb.aspx.cs" Inherits="ZVerseBrickProject.Placque" %>
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
    <!--Styling the brick canvas -->
    <style>
        #productBrick{
            margin: 20px 0 20px 0px ;
        }
        #canvas{
            background-color: #E6F2FF;
            width:700px;
            height: 400px;
            margin: 0 30px 0 0;
            position: static;
            top: 10px;
            left: 0px;
            border: 1px solid;
            border-color:#99BBFF;
        }
    </style> 
    <div>
        <h1>Mizzou Tradition Plaza Paved Replica</h1>
    </div>
    <div class="row" id="productBrick">
        <!--Actual webgl brick canvas -->
        <div id="canvas" class="col-md-8">        
        </div>

        <!--Product description and textboxes to add the input lines -->
        <div class="col-md-4">
            <b>Description:</b><br />Pleased to offer our alumni an opportunity to take a piece of traditions plaza back to home or office.
            <br />
            <br />
            <span><b>Price:</b>&nbsp; $75.00</span>
            <br />
            <br />
            <br />
            <br />
            <p>
            Please complete the following to add text to the break. May need to hit enter to have your text render on the brick
            </p>
            <!--Top line text box, calls getText1() in newBrickRendering.js on key press or key up-->
            <div class="textBoxLine">
                <asp:Label AssociatedControlID="textbox1">Top Text Line:
                <asp:TextBox ID="textBox1" runat="server" MaxLength="40" placeholder="text line 1" onKeyPress ="getText1(this.value)" onKeyUp = "getText1(this.value)"></asp:TextBox>
                </asp:Label>
            </div>
            <br />
            <br />
            <!--Middle line text box, calls getText2() in newBrickRendering.js on key press or key up-->
            <div class="textBoxLine">
                <asp:Label AssociatedControlID="textbox2">Middle Text Line:
                <asp:TextBox ID="textBox2" runat="server" MaxLength="40" placeholder="text line 2" onKeyPress ="getText2(this.value)" onKeyUp = "getText2(this.value)"></asp:TextBox>
                </asp:Label>
            </div>
            <br />
            <br />
            <!--Bottom line text box, calls getText2() in newBrickRendering.js on key press or key up-->
            <div class="textBoxLine">
                <asp:Label AssociatedControlID="textbox3">Bottom Text Line:
                <asp:TextBox ID="textBox3" runat="server" MaxLength="40" placeholder="text line 3" onKeyPress ="getText3(this.value)" onKeyUp = "getText3(this.value)"></asp:TextBox>
                </asp:Label>
            </div>
            <br />
            <br />
            <br />
                   
            <!--Shopping Cart button redirect to order page -->
            <div>
            <a class="btn btn-success" href="/AddToCart.aspx?productID=13">               
                <span class="ProductListItem">
                    <b>Add To Cart</b> 
                 </span>           
            </a>
            </div>

        </div>
    </div>

    <!--this file does...-->
    <script src="js/threex.dynamictexture.js"></script>
    <!--this file does...-->
    <script src="js/three.min.js"></script>
    <!--Containing file for brick and text rendering functions-->
    <!--Note this js file must be at the end of div content-->
    <script src="js/Plaque.js"></script>

</asp:Content>