<%@ Page Title="BrickDisplay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrickDisplay.aspx.cs" Inherits="ZVerseBrickProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <!-- <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
       -->

        <script src="js/three.min.js"></script>
        <script src="js/MTLLoader.js"></script>
        <script src="js/OBJMTLLoader.js"></script>
        <script src="js/OBJLoader.js"></script>
        <script src="js/THREEx.WindowResize.js"></script>
        <script src="js/OrbitControls.js"></script>
        <script src="js/stats.min.js"></script>
        <script src="js/script.js"></script>


    <h2 style="text-align: right">Mizzou Tradition Plaza Paved Replica</h2>
    <p style="text-align: right">
        Pleased to offer our alumni an opportunity to take a piece of Traditions Plaza back home!   
    </p>
    <p style="text-align: right">
        $75.00
    </p>
    <a class="btn btn-default" style="float: right;" href="http://shop.zverse.com/collections/mizzou/products/mizzou-traditions-plaza-paver-replica">Learn more &raquo;</a>


</asp:Content>
