﻿<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
         CodeBehind="ProductDetails.aspx.cs" Inherits="ZVerseBrickProject.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="productDetail" runat="server" ItemType="ZVerseBrickProject.Models.Product" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
<!-----------------------------------------------------------------------------
* Name: ProductDetails.aspx
* Author: 
*   Ming Wong
* Edited By:
*   ***********************************************************************************************
* Description: This aspx view generates the html for the individual products 
*   on the product page.
------------------------------------------------------------------------------>
            <div>
                <h1><%#:Item.ProductName %></h1>
            </div>
            <br />
            <table>
                <tr>
                    <td>
                        <img src="/Images/productImages/<%#:Item.ImagePath %>" style="border:solid; height:300px" alt="<%#:Item.ProductName %>"/>
                    </td>
                    <td>&nbsp;</td>  
                    <td style="vertical-align: top; text-align:left;">
                        <b>Description:</b><br /><%#:Item.Description %>
                        <br />
                        <span><b>Price:</b>&nbsp;<%#: String.Format("{0:c}", Item.UnitPrice) %></span>
                        <br />
                        <br />
                        <a class="btn btn-success" href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">
                            <span class="ProductListItem">
                                <b>Add To Cart<b>
                            </span>
                        </a>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>