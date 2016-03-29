using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics; 
using ZVerseBrickProject.Controllers;
using ZVerseBrickProject.Models;

namespace ZVerseBrickProject
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["ProductID"];
            int productId;
            if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productId))
            {
                int currentID = Convert.ToInt16(rawId);
                
                //create new product and brick model if it is a custom model 
                if((currentID < 0))
                {
                    string text1 = Request.QueryString["tb1"];
                    string text2 = Request.QueryString["tb2"];
                    string text3 = Request.QueryString["tb3"];
                    string incription = string.Concat(text1, " ", text2, " ", text3); 
                    var _db = new ZVerseBrickProject.Models.ProductContext();
                    Brick theproduct;
                    AddProducts products = new AddProducts();
                    AddBricks bricks = new AddBricks();
                    bool isStandard = false;
                    bool isVisible = false; 

                    theproduct = _db.Bricks.Find(-currentID);
                    //Debug.WriteLine("add to cart: js path is " + theproduct.JSPath);
                    currentID = products.AddProduct(theproduct.BrickName, theproduct.Description,theproduct.UnitPrice.ToString(), "1", theproduct.ImagePath, incription);
                    bricks.AddBrick(currentID, theproduct.BrickName, theproduct.Description, incription, theproduct.UnitPrice.ToString(), theproduct.ImagePath, theproduct.JSPath, isVisible, "show", isStandard, text1, text2, text3);

                }

                using (ShoppingCartFunctions usersShoppingCart = new ShoppingCartFunctions())
                {
                    usersShoppingCart.AddToCart(currentID);
                }

            }
            else
            {
                Debug.Fail("ERROR : We should never get to AddToCart.aspx without a ProductId.");
                throw new Exception("ERROR : It is illegal to load AddToCart.aspx without setting a ProductId.");
            }
            Response.Redirect("ShoppingCart.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}