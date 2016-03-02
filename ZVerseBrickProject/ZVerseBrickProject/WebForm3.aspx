<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="ZVerseBrickProject.WebForm3" %>

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
     <div class="col-md-4">
            <b>Description:</b><br />Pleased to offer our alumni an opportunity to take a piece of traditions plaza back to home or office.
            <br />
            <br />
            <span><b>Price:</b>&nbsp; $75.00</span>
            <br />
            <br />
            <br />
            <br />
         </div>
   

  <script src="js/three.min.js"></script> 
            <script src="js/MTLLoader.js"></script>
         <script src="js/OBJMTLLoader.js"></script> 
        <script src="js/OBJLoader.js"></script> 
        <script src="js/THREEx.WindowResize.js"></script> 
        <script src="js/OrbitControls.js"></script> 
        <script src="js/stats.min.js"></script> 
            <script src="js/script.js"></script>
    </div>
