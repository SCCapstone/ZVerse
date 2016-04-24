using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Linq;
using ZVerseBrickProject.Models;
using ZVerseBrickProject.Controllers;

/*
* Name: Site.Master.cs
* Author:
*  Auto-generated
* Edit by:
#   Ming Wong, Chris Clymer, Alexa Breeland 
* Description: 
    This file contains all the functions relating to the overal theme of the website.  
*/

namespace ZVerseBrickProject
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        /* Only display admin page on navbar when admin is login */
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("admin"))
            {
                adminLink.Visible = true;
            }

           
        }
        /* Display the number of items on shopping cart on navbar */ 
        protected void Page_PreRender(object sender, EventArgs e)
        {
            using (ShoppingCartFunctions usersShoppingCart = new ShoppingCartFunctions())
            {
                string cartStr = string.Format("Cart ({0})", usersShoppingCart.GetCount());
                cartCount.InnerHtml = "<span class='glyphicon glyphicon-shopping-cart'></span>" + cartStr;
            }
        }
        /* Obtain the categories */ 
        public IQueryable<Category> GetCategories()
        {
            var _db = new ZVerseBrickProject.Models.ProductContext();
            IQueryable<Category> query = _db.Categories;
            return query;
        }

        /* Obtain all the custom brick models which admin has set it to show */ 
        public IQueryable<Brick> GetBricks()
        {
            var _db = new ZVerseBrickProject.Models.ProductContext();
            IQueryable<Brick> query = _db.Bricks;
            query = query.Where(b => b.isVisible == true);
            return query;
        }

        /* Keep the session cookies for login users */ 
        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Session.Abandon();
            Response.Cookies.Clear();
        }
    }

}