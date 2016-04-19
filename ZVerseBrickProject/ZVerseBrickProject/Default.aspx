<%@ Page Title="ZVerse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ZVerseBrickProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--http://stackoverflow.com/questions/4013955/how-to-include-css-in-master-pages--%>
    <div class="jumbotron">
        <h1><%: Title %>.</h1>
        <p class="lead">ZVerse delivers turnkey 3D printing solutions from 3D content creation to full color production.</p>
        <p><a href="http://zverse.com/" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
        <video width="500" height="500" controls>
     <source src="video/ZVerse.mp4" type="video/mp4">
    Your browser does not support the video tag.
    </video>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>3D Content Creation</h2>
            <p>
                The LAYR content creation platform is making it easy to turn 2D to 3D
            </p>
            <p>
                <a class="btn btn-default" href="http://zverse.com/layr/">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Product Engineering</h2>
            <p>
               We specialize in 3D design of products specifically engineered for 3D printing.
            </p>
            <p>
                <a class="btn btn-default" href="http://zverse.com/3d-modeling/">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Full Color 3D Printing</h2>
            <p>
                No one knows more about 3D color print production. Our experience and efficiency is unmatched.
            </p>
            <p>
                <a class="btn btn-default" href="http://zverse.com/3d-print-production/">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
