<%@ Page Title="BrickDisplay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrickDisplay.aspx.cs" Inherits="ZVerseBrickProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
       -->


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
            height: 500px;
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

        <script src="js/three.min.js"></script> 
        <script src="js/DDSLoader.js"></script>
        <script src="js/MTLLoader.js"></script> 
        <script src="js/OBJLoader.js"></script> 
        <script src="js/Detector.js"></script>
        <script src="js/THREEx.WindowResize.js"></script> 
        <script src="js/OrbitControls.js"></script> 
        <script src="js/stats.min.js"></script> 
        <script src="js/script.js"></script>
 





















<%--    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Script Tutorials" />
        <title>WebGL With Three.js - Lesson 6 - loading models - OBJ | Script Tutorials</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!--<link href="css/main.css" rel="stylesheet" type="text/css" />-->
    </head>
    <body>
        <script src="js/three.min.js"></script> 
        <script src="js/MTLLoader.js"></script>
        <script src="js/OBJMTLLoader.js"></script> 
        <script src="js/OBJLoader.js"></script> 
        <script src="js/THREEx.WindowResize.js"></script> 
        <script src="js/OrbitControls.js"></script> 
        <script src="js/stats.min.js"></script> 
        <script src="js/script.js"></script>
    </body>
    </html>
   

    <h2 style="text-align: right">Mizzou Tradition Plaza Paved Replica</h2>
    <p style="text-align: right">
        Pleased to offer our alumni an opportunity to take a piece of Traditions Plaza back home! 
        </br >
        Below is a sample of our real brick without text.   
    </p>
    <p style="text-align: right">
        $75.00
    </p>
    <a class="btn btn-default" style="float: right;" href="http://shop.zverse.com/collections/mizzou/products/mizzou-traditions-plaza-paver-replica">Learn more &raquo;</a>--%>


</asp:Content>


<%--<style>
div.background {
  background: url(http://zverse.azurewebsites.net/BrickDisplay);
  border: 2px solid black;
}

div.transbox {
  margin: 30px;
  background-color: #ffffff;
  border: 1px solid black;
  opacity: 0.1;
  filter: alpha(opacity=90); /* For IE8 and earlier */
}

div.transbox p {
  margin: 5%;
  font-weight: bold;
  color: #000000;
}
</style>



<div class="background">
  <div class="transbox">
    <p>This is some text that is placed in the transparent box.</p>
  </div>
</div>


    



    <h2 style="text-align: right">Mizzou Tradition Plaza Paved Replica</h2>
    <p style="text-align: right">
        Pleased to offer our alumni an opportunity to take a piece of Traditions Plaza back home!   
    </p>
    <p style="text-align: right">
        $75.00
    </p>
    <a class="btn btn-default" style="float: right;" href="http://shop.zverse.com/collections/mizzou/products/mizzou-traditions-plaza-paver-replica">Learn more &raquo;</a>
    
   --%>


