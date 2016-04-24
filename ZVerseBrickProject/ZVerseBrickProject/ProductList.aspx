<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ZVerseBrickProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<!-----------------------------------------------------------------------------
* Name: ProductList.aspx
* Author:
*   Ming Wong
* Edited By:
*   *************************************************************************************
* Description: This aspx file is used to generate the product listings in the 
*   catalogue view.
------------------------------------------------------------------------------>
    <!-- Responsible for the filtering the school categories -->
    <ol style="visibility:hidden;"></ol>
    <div id="CategoryMenu" style="text-align: left">
        <h4>Filter by Category:</h4>
        <asp:ListView ID="categoryList"  
                ItemType="ZVerseBrickProject.Models.Category" 
                runat="server"
                SelectMethod="GetCategories" >
            <ItemTemplate>
                <b style="font-size: 150%; font-style: normal">
                    <a href="/ProductList.aspx?id=<%#: Item.CategoryID %>">
                        <%#: Item.CategoryName %>
                    </a>
                </b>
            </ItemTemplate>
            <ItemSeparatorTemplate>
                 |
            </ItemSeparatorTemplate>
        </asp:ListView>
    </div>

    <!-- Responsible for listing out the price, title, and image of the product. 
        Create the hyperlink to the product detail page. -->
    <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>
            <asp:ListView ID="productList" runat="server" 
                DataKeyNames="ProductID" GroupItemCount="3"
                ItemType="ZVerseBrickProject.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>

                <ItemTemplate>
                    <td class =" col-md-3"  runat="server">
                        <table class ="table">
                           <tr>
                                <td class =" col-md-3">
                                     <a href="ProductDetails.aspx?productID=<%#:Item.ProductID%>">
                                       <img src="Images/productImages/<%#:Item.ImagePath%>"
                                            width="280" height="210"  style="border: none; margin: auto; " />
                                     </a> 
                                </td> 
                            </tr>
                            <tr>
                                <td class =" col-md-3">
                                     <a href="ProductDetails.aspx?productID=<%#:Item.ProductID%>"> 
                                        <span>
                                            <%#:Item.ProductName%>
                                        </span>
                                    </a>
                                    <br />
                                    <span>
                                        <b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                    </span>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class =" col-md-3">&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>

                
                <LayoutTemplate>
                <!-- Responsible for the grid layout of the product list page -->
                    <table style="width:100%;";>
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
         </div>
    </section>
</asp:Content>