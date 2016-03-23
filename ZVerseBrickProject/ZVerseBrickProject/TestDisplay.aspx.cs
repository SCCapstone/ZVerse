using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZVerseBrickProject.Models;
using System.Web.ModelBinding;
using System.Diagnostics;

namespace ZVerseBrickProject
{
    public partial class TestDisplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.Write("query: pageload");
        }

        public IQueryable<Brick> GetBrick([QueryString("brickID")] int? brickId)
        {
            var _db = new ZVerseBrickProject.Models.ProductContext();
            IQueryable<Brick> query = _db.Bricks;
            //query = query.Where(p => p.BrickID == 1);
            if (brickId.HasValue && brickId > 0)
            {
                query = query.Where(p => p.BrickID == brickId);

            }
            else
            {
                query = null;
            }
            //Debug.Write("query: " + query);

            return query;
        }
    }
}