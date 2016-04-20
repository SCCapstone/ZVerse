<%@ Page Title="ZVerse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ZVerseBrickProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--http://stackoverflow.com/questions/4013955/how-to-include-css-in-master-pages--%>
    <%--<div class="jumbotron">
        <h1 style="font:bold French Script MT"><%: Title %>.</h1>
      <p> We make 2D content 3D printable </p>
         <p>  <a href="http://zverse.com/" class="btn btn-lg">Learn more &raquo;</a></p>
         
    </div>--%>
    <br />
    <IMG SRC="Images/zverse.png" ALT="Welcome to Zverse!" WIDTH=1175 HEIGHT=200>

    <div class="row">
        <div class ="col-md-6">
      <video width="500" height="375" autoplay controls>
     <source src="video/ZVerse-Cropped.mp4" type="video/mp4">
    Your browser does not support the video tag.
    </video>
 

        </div>
        <div class="col-md-6">

            <h2 style="color:orangered;"> 
                3D Content Creation</h2>
            <p>
                The LAYR content creation platform is making it easy to turn 2D to 3D
            </p>
            <p>
                <a class="btn btn-primary" href="http://zverse.com/layr/">Learn more &raquo;</a>
            </p>
       <%-- </div>
        <div class="col-md-4">--%>
            <div class="boxed">
            <h2 style="color:orangered;"> 
                Product Engineering</h2>
            <p>
               We specialize in 3D design of products specifically engineered for 3D printing.
            </p>
            <p>
                <a class="btn btn-primary" href="http://zverse.com/3d-modeling/">Learn more &raquo;</a>
            </p>
                </div>
        <%--</div>
        <div class="col-md-4">--%>
            <div class="boxed">
            <h2 style="color:orangered;"> 
                Full Color 3D Printing</h2>
            <p>
                No one knows more about 3D color print production. Our experience and efficiency is unmatched.
            </p>
            <p>
                <a class="btn btn-primary" href="http://zverse.com/3d-print-production/">Learn more &raquo;</a>
            </p>
                </div>
        </div>
    </div>
<style>
    .boxed {
  border-top: 1px solid black ;
}
</style>
</asp:Content>
