<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="ZVerseBrickProject.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<!-----------------------------------------------------------------------------
* Name: ShoppingCart.aspx
* Author: Ming Wong 
* Description: This file generates the shopping cart view.
------------------------------------------------------------------------------>
    <div id="ShoppingCartTitle" runat="server" class="ContentHead">
        <h1>Shopping Cart</h1>
    </div>
    <!--Cart Column Definitions-->
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="ZVerseBrickProject.Models.CartItem" SelectMethod="GetShoppingCartItems"
        OnRowCreated="gridViewOrders_RowCreated" CssClass="table table-striped table-bordered">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" />
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:LinkButton ID="producturl" runat="server" Text="<%#: Item.Product.ProductName %>" CommandArgument="<%#: Item.ProductId %>" OnCommand="producturlClick"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Product.UnitPrice" HeaderText="Unit Price" DataFormatString="{0:c}" />
            <asp:BoundField DataField="Product.Incription" HeaderText="Inscription" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:CheckBox ID="Delete" runat="server"></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Total">
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <!--Shopping Cart Summary-->
    <div>
        <p></p>
        <asp:Label ID="LabelShipping" runat="server" Text="Shipping Cost: $5.00"></asp:Label>
        <br />
        <asp:Label ID="LabelTax" runat="server" Text="Sales Tax: "></asp:Label>
        <asp:Label ID="lbltaxTotal" runat="server" EnableViewState="false"></asp:Label>
        <br />
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong>
    </div>
    <br />

    <!--Shopping Cart Update and Checkout Buttons-->
    <table>
        <tr>
            <td>
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="btn btn-info" OnClick="UpdateBtn_Click" />
            </td>
            <td>&nbsp
            </td>
            <td>
                <!--Checkout Button -->
                <asp:LinkButton ID="CheckoutBtn" runat="server" Text="Checkout" CssClass="btn btn-success" OnClick="CheckoutBtn_Click"> 
                <span aria-hidden="true" class="glyphicon glyphicon-ok-sign"> Checkout</span>                                       
                </asp:LinkButton>
            </td>
        </tr>
    </table>

</asp:Content>
