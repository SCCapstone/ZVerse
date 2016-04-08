using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZVerseBrickProject.Controllers;
using ZVerseBrickProject.Models;
using System.Collections.Specialized;
using System.Collections;
using System.Web.ModelBinding;
using System.Diagnostics;
 

namespace ZVerseBrickProject
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (ShoppingCartFunctions usersShoppingCart = new ShoppingCartFunctions())
            {
                decimal cartTotal = 0;
                cartTotal = usersShoppingCart.GetTotal();
                if (cartTotal > 0)
                {
                    // Display Total.
                    // tax = 7% of the subtotal + shipping 
                    var tax = (decimal)0.07 * (cartTotal + (decimal)5.00);
                    var total = cartTotal + tax;  
                    lbltaxTotal.Text = String.Format("{0:c}", tax ); 
                    lblTotal.Text = String.Format("{0:c}", total);
                }
                else
                {
                    LabelShipping.Text = "";
                    LabelTax.Text = "";
                    lbltaxTotal.Text = "";
                    LabelTotalText.Text = "";
                    lblTotal.Text = "";
                    ShoppingCartTitle.InnerHtml = "<h2>Please add an item onto the shopping cart.</h2>";
                    UpdateBtn.Visible = false;
                    CheckoutBtn.Visible = false;
                }
            }
        }

        protected void gridViewOrders_RowCreated(object sender, GridViewRowEventArgs e)
        {

            using (ShoppingCartFunctions usersShoppingCart = new ShoppingCartFunctions())
            {
               
                decimal cartTotal = 0;
                cartTotal = usersShoppingCart.GetTotal();
                if (cartTotal > 0)
                {
                    if (e.Row.RowType == DataControlRowType.Footer)
                    {
                        int intNoOfMergeCol = e.Row.Cells.Count - 1;
                        for (int intCellCol = 1; intCellCol < intNoOfMergeCol; intCellCol++)
                        {
                            e.Row.Cells.RemoveAt(1);
                        }
                        e.Row.Cells[0].ColumnSpan = intNoOfMergeCol;
                        e.Row.Cells[0].Text = "SubTotal: "; 
                        e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Right;
                        e.Row.Cells[1].Font.Bold = true;
                        e.Row.Cells[1].Text = String.Format("{0:c}", cartTotal);
                    }
                }

                
            }


        }

        protected void  producturlClick(object sender, CommandEventArgs e)
        {
            int productid = Convert.ToInt32(e.CommandArgument.ToString());
            Debug.WriteLine("shopping cart: " + productid); 
            if (productid > 15)
            {
                ProductContext _db = new ProductContext();
                int brickid = (from b in _db.Bricks where b.pid == productid select b.BrickID).FirstOrDefault();
                Response.Redirect("TestDisplay.aspx?brickID=" + brickid); 
            }else
            {
                Response.Redirect("ProductDetails.aspx?productID=" + productid);
            }
            Context.ApplicationInstance.CompleteRequest();

        }
        public List<CartItem> GetShoppingCartItems()
        {
            ShoppingCartFunctions actions = new ShoppingCartFunctions();
            return actions.GetCartItems();
        }
        public List<CartItem> UpdateCartItems()
        {
            using (ShoppingCartFunctions usersShoppingCart = new ShoppingCartFunctions())
            {
                String cartId = usersShoppingCart.GetCartId();

                ShoppingCartFunctions.ShoppingCartUpdates[] cartUpdates = new ShoppingCartFunctions.ShoppingCartUpdates[CartList.Rows.Count];
                for (int i = 0; i < CartList.Rows.Count; i++)
                {
                    IOrderedDictionary rowValues = new OrderedDictionary();
                    rowValues = GetValues(CartList.Rows[i]);
                    cartUpdates[i].ProductId = Convert.ToInt32(rowValues["ProductID"]);

                    CheckBox cbRemove = new CheckBox();
                    cbRemove = (CheckBox)CartList.Rows[i].FindControl("Delete");
                    cartUpdates[i].RemoveItem = cbRemove.Checked;

                    TextBox quantityTextBox = new TextBox();
                    quantityTextBox = (TextBox)CartList.Rows[i].FindControl("PurchaseQuantity");
                    cartUpdates[i].PurchaseQuantity = Convert.ToInt16(quantityTextBox.Text.ToString());
                }
                usersShoppingCart.UpdateShoppingCartDatabase(cartId, cartUpdates);
                CartList.DataBind();
                var cartTotal = usersShoppingCart.GetTotal(); 
                var tax = (decimal)0.07 * (cartTotal + (decimal)5.00);
                var total = cartTotal + tax;
                lbltaxTotal.Text = String.Format("{0:c}", tax);
                lblTotal.Text = String.Format("{0:c}", cartTotal);
                return usersShoppingCart.GetCartItems();
            }
        }

        public static IOrderedDictionary GetValues(GridViewRow row)
        {
            IOrderedDictionary values = new OrderedDictionary();
            foreach (DataControlFieldCell cell in row.Cells)
            {
                if (cell.Visible)
                {
                    // Extract values from the cell.
                    cell.ContainingField.ExtractValuesFromCell(values, cell, row.RowState, true);
                }
            }
            return values;
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            UpdateCartItems();
        }

        protected void CheckoutBtn_Click(object sender, EventArgs e)
        {
            using (ShoppingCartFunctions usersShoppingCart = new ShoppingCartFunctions())
            {
                usersShoppingCart.EmptyCart();
            }   
            Response.Redirect("Checkout.aspx");
        }
    }
}