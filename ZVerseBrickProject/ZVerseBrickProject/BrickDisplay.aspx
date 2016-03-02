<%@ Page Title="BrickDisplay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrickDisplay.aspx.cs" Inherits="ZVerseBrickProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
       -->

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

    
    <h2 style="text-align: right">Mizzou Tradition Plaza Paved Replica</h2>
    <p style="text-align: right">
        Pleased to offer our alumni an opportunity to take a piece of Traditions Plaza back home! 
        </br >
        Below is a sample of our real brick without text.   
    </p>
    <p style="text-align: right">
        $75.00
    </p>
    <a class="btn btn-default" style="float: right;" href="http://shop.zverse.com/collections/mizzou/products/mizzou-traditions-plaza-paver-replica">Learn more &raquo;</a>


    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Script Tutorials" />
        <title>Brick Display</title>
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

</asp:Content>


