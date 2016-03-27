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

        //This function will set the brickmodel visible property to 
        // be true to reveal the model on the tab and catalogue. 
        protected void AddCart(object sender, CommandEventArgs e)
        {
            int brickid = -Int32.Parse(e.CommandArgument.ToString());
            TextBox tb1 = (TextBox)BrickDetail.FindControl("textBox1");
            TextBox tb2 = (TextBox)BrickDetail.FindControl("textBox2");
            TextBox tb3 = (TextBox)BrickDetail.FindControl("textBox3");
            string txt1 = tb1.Text;
            string txt2 = tb2.Text;
            string txt3 = tb3.Text;
            Debug.WriteLine("txt1 is " + txt1);
            Debug.WriteLine("brickid is " + brickid);
            Response.Redirect("AddToCart.aspx?productID=" + brickid +
                "&tb1=" + txt1 + "&tb2=" + txt2 + "&tb3=" + txt3, false);
            Context.ApplicationInstance.CompleteRequest();

        }
    }
}