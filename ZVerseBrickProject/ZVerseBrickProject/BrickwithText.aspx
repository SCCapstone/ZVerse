<%@ Page Title="Brick with Text" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrickwithText.aspx.cs" Inherits="ZVerseBrickProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
         <style>
             #productBrick{
                  margin: 20px 0 20px 0px ;
             }
            #canvas{
                background-color: #000;
                width:700px;
                height: 400px;
                margin: 0 30px 0 0;
                position: static;
                top: 10px;
                left: 0px;
            }
        </style>
        <script src="js/threex.dynamictexture.js"></script>
        <script src="js/three.min.js"></script>
   
   
       
        <br />
        <div>
               <h1>Mizzou Tradition Plaza Paved Replica</h1>
         </div>
    <div class="row" id="productBrick">
       <div id="canvas" class="col-md-8">        
        </div>
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
            <br />
            <br />
             <br />
            
         <a class="btn btn-success" href="/AddToCart.aspx?productID=13">               
                                        <span class="ProductListItem">
                                            <b>Add To Cart<b>
                                        </span>           
                                    </a>
        </div>
    </div>

   
     <script src="js/newBrickRendering.js"></script>

</asp:Content>
