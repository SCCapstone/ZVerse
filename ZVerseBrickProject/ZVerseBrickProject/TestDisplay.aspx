<%@ Page Title="TestDisplay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="TestDisplay.aspx.cs" Inherits="ZVerseBrickProject.TestDisplay" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--Styling the brick canvas -->
    <style>
        #productBrick {
            margin: 20px 0 20px 0px;
        }

        #canvas {
            background-color: #E6F2FF;
            width: 700px;
            height: 500px;
            margin: 0 30px 0 0;
            position: static;
            top: 10px;
            left: 0px;
            border: 1px solid;
            border-color: #99BBFF;
        }
    </style>

    <asp:FormView ID="BrickDetail" runat="server" ItemType="ZVerseBrickProject.Models.Brick" SelectMethod="GetBrick" RenderOuterTable="false">

        
        <ItemTemplate>

            <div>
                <h1><%#:Item.BrickName %></h1>
            </div>
            <div class="row" id="productBrick">

                <!--Actual webgl brick canvas -->
                <div id="canvas" class="col-md-8">
                </div>

                <!--Product description and textboxes to add the input lines -->
                <div class="col-md-4">
                    <b>Name: </b><%#:Item.BrickName %>
                    <br />
                    <br />
                    <b>Description:</b><br />
                    <%#:Item.Description %>
<%--                    <br />
                    <br />
                    <b>Inscription (this is for debuggin purpose):</b><br />
                    <%#:Item.Incription %>--%>
                    <br />
                    <br />
                    <span><b>Price:</b>&nbsp; <%#: String.Format("{0:c}", Item.UnitPrice) %></span>
                    <br />
                    <br />
                    <p>
                        Please complete the following to add text to your object!
                    </p>
                    <input type="radio" name="browser" onclick="check(this.value)" id="cursive" value="French Script MT">French Script MT<br>
                    <input type="radio" name="browser" onclick="check(this.value)" id="helv" value="Charlesworth">Charlesworth<br>
                    <input type="radio" name="browser" onclick="check(this.value)" id="opt" value="Comic Sans MS">Comic Sans MS<br>
                    <br>
                    Your font is:
                    <input type="text" id="answer" size="20">

                    <br />
                     <br />
                    <!--Top line text box, calls getText1() in newBrickRendering.js on key press or key up-->
                    <div class="textBoxLine">
                        <asp:Label AssociatedControlID="textbox1" runat="server">Top Text Line:
                <asp:TextBox ID="textBox1" runat="server" MaxLength="40" placeholder="text line 1" Text="<%#:Item.tb1%>" CssClass="tb1" onKeyPress="getText1(this.value, answer.value)" onKeyUp="getText1(this.value, answer.value)"></asp:TextBox>
                        </asp:Label>
                    </div>
                    <br />
                    <br />
                    <!--Middle line text box, calls getText2() in newBrickRendering.js on key press or key up-->
                    <div class="textBoxLine">
                        <asp:Label AssociatedControlID="textbox2" runat="server">Middle Text Line:
                <asp:TextBox ID="textBox2" runat="server" MaxLength="40" placeholder="text line 2"  Text="<%#:Item.tb2%>" CssClass="tb2" onKeyPress="getText2(this.value, answer.value)" onKeyUp="getText2(this.value, answer.value)"></asp:TextBox>
                        </asp:Label>
                    </div>
                    <br />
                    <br />
                    <!--Bottom line text box, calls getText2() in newBrickRendering.js on key press or key up-->
                    <div class="textBoxLine">
                        <asp:Label AssociatedControlID="textbox3" runat="server">Bottom Text Line:
                <asp:TextBox ID="textBox3" runat="server" MaxLength="40" placeholder="text line 3"  Text="<%#:Item.tb3%>" CssClass="tb3" onKeyPress="getText3(this.value, answer.value)" onKeyUp="getText3(this.value, answer.value)"></asp:TextBox>
                        </asp:Label>
                    </div>
                    <br />
                    <br />
                    <br />

                    <!--Shopping Cart button redirect to order page -->
                    <asp:Button runat="server" ID="Show" Text="Add To Cart" class="btn btn-success" CommandArgument="<%#:Item.BrickID %>" OnCommand="AddCart" />




                </div>
            </div>

            <!--this file does...-->
            <script src="js/threex.dynamictexture.js"></script>
            <!--this file does...-->
            <script src="js/Three.js"></script>
            <script src="js/three.min.js"></script>
            
            <!--Automatically draw on the brick when inscription is not empty -->
            <script>
                function check(browser) {
                    document.getElementById("answer").value = browser;
                    if ($('.tb1').val().length > 0) {
                        //alert("tb1 is more than one");
                        getText1($('.tb1').val(), browser);
                    }
                    if ($('.tb2').val().length > 0) {
                        //alert("tb2 is more than one");
                        getText2($('.tb2').val(), browser);
                    }
                    if ($('.tb3').val().length > 0) {
                        // alert("tb3 is more than one");
                        getText3($('.tb3').val(), browser);
                    }
                }

                $(document).ready(function () {
                    if ($('.tb1').val().length > 0) {
                        //alert("tb1 is more than one");
                        getText1($('.tb1').val());
                    }
                    if ($('.tb2').val().length > 0) {
                        //alert("tb2 is more than one");
                        getText2($('.tb2').val());
                    }
                    if ($('.tb3').val().length > 0) {
                        // alert("tb3 is more than one");
                        getText3($('.tb3').val());
                    }

                })
            </script>
            <!--Containing file for brick and text rendering functions-->
            <!--Note this js file must be at the end of div content-->
            <script src="js/<%#Item.JSPath %>"></script>

        </ItemTemplate>
    </asp:FormView>

</asp:Content>
