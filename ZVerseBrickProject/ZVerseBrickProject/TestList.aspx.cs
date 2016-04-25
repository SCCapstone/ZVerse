using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZVerseBrickProject.Models;
using System.Web.ModelBinding;
/*
* Name: TestList.aspx.cs
* Author:
*   Ming Wong
* Description: 
    This file contains all the functions pertaining to the TestList page, 
    which is the page contaning the catalogue of custom brick models.  
*/


namespace ZVerseBrickProject
{
    public partial class TestForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /* Only obtain the custom brick model where the admin has 
        set to show */ 
        public IQueryable<Brick> GetBricks()
        {
            var _db = new ZVerseBrickProject.Models.ProductContext();
            IQueryable<Brick> query = _db.Bricks;
            query = query.Where(b => b.isVisible == true);
            return query;
        }


    }
}