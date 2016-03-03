using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZVerseBrickProject.Models;
using System.Web.ModelBinding;


namespace ZVerseBrickProject
{
    public partial class TestForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Brick> GetBricks()
        {
            var _db = new ZVerseBrickProject.Models.ProductContext();
            IQueryable<Brick> query = _db.Bricks;
            return query;
        }


    }
}