<%@ Page Title="Models with Text" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestList.aspx.cs" Inherits="ZVerseBrickProject.TestForm" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <ol style="visibility: hidden;"></ol>

    <section>
        <div>
            <hgroup>
                <h2 style="font-style:oblique"><%: Page.Title %></h2>
            </hgroup>

            <asp:ListView ID="BrickList" runat="server"
                DataKeyNames="BrickID" GroupItemCount="3"
                ItemType="ZVerseBrickProject.Models.Brick" SelectMethod="GetBricks">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td class=" col-md-3" runat="server">
                        <table class="table">
                            <tr>
                                <td class=" col-md-3">
                                    <a href="TestDisplay.aspx?brickID=<%#:Item.BrickID%>">
                                    <img src="js/<%#:Item.ImagePath%>"
                                        width="280" height="210" style="border: none; margin: auto;" /></a> 
                                </td>
                            </tr>
                            <tr>
                                <td class=" col-md-3">
                                    <a href="TestDisplay.aspx?brickID=<%#:Item.BrickID%>">
                                        <span>
                                            <%#:Item.BrickName%>
                                        </span>
                                    </a>
                                    <br />
                                    <span>
                                        <b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                    </span>
                                    <br />
<%--                                    <a class="btn btn-success btn-sm" href="/AddToCart.aspx?productID=-<%#Item.BrickID %>">
                                        <span class="ProductListItem">
                                            <b>Add To Cart<b>
                                        </span>
                                    </a>--%>

                                </td>
                            </tr>
                            <tr>
                                <td class=" col-md-3">&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width: 100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
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
