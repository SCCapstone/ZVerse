<%@ Page Title="Final" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Final.aspx.cs" Inherits="ZVerseBrickProject.Dropdownbar" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="description">
        <h1> Brick Replica </h1>
        <p> information here </p>  
    </div>

    <div id="windowControls">
        <ul class="nav">
            <li>This item has a dropdown
                <ul>
                    <li>Sub item 1</li>
                    <li>Sub item 2</li>
                </ul>
            </li>    
            <li>Item</li>
            <li>So does this item
                <ul>
                    <li>Sub item 1</li>
                    <li>Sub item 2</li>
                </ul>
            </li>
        </ul>

    </div>
    
    <div id="Checkout">
        <p> Check tab goes here </p>
    </div>
    
    <div id="BrickDisplay">
        <p> brick display window goes here </p>
    </div>

    <div id="productList">
        <p> product list goes here </p>
    </div>
</asp:Content>
