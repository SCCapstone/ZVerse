using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZVerseBrickProject.Models;
using System.Data.Entity.Infrastructure;
using System.Diagnostics; 

namespace ZVerseBrickProject.Admin
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Brick> GetBricks()
        {
            var _db = new ZVerseBrickProject.Models.ProductContext();
            IQueryable<Brick> query = _db.Bricks;
           // query = query.Where(b => b.isStandard == true);
            return query;
        }

        
        //This function will set the brickmodel visible property to 
        // be true/false to reveal the model on the dropdown and catalogue. 
        protected void ShowHide(object sender, CommandEventArgs e)
        {
            int brickid = Int32.Parse(e.CommandArgument.ToString());
            var _db = new ZVerseBrickProject.Models.ProductContext();
            Brick thebrick;
            thebrick = _db.Bricks.Find(brickid);

            //toggle the visibility property
            if (thebrick.isVisible)
            {
                thebrick.isVisible = false;
                thebrick.showhide = "Show";
            }
            else
            {
                thebrick.isVisible = true;
                thebrick.showhide = "Hide";
            }
            _db.SaveChanges();
            Response.Redirect("AdminPage.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void RemoveBrick(object sender, CommandEventArgs e)
        {
            int brickid = Int32.Parse(e.CommandArgument.ToString());
            var _db = new ZVerseBrickProject.Models.ProductContext();
            Brick thebrick;
            Product theproduct; 
            thebrick = _db.Bricks.Find(brickid);
            theproduct = _db.Products.Find(thebrick.pid); 

            _db.Bricks.Remove(thebrick);
            _db.Products.Remove(theproduct);
            _db.SaveChanges();
            Response.Redirect("AdminPage.aspx", false);
            Context.ApplicationInstance.CompleteRequest();

        }

        public static Control FindControlRecursive(Control Root, string Id)
        {
            if (Root.ID == Id)
                return Root;

            foreach (Control Ctl in Root.Controls)
            {
                Control FoundCTl = FindControlRecursive(Ctl, Id);
                if (FoundCTl != null)
                    return FoundCTl;

            }

            return null;
        }
        protected void lv_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("testbrick"))
            {
                //TextBox t = bricklist.Items[Convert.ToInt32(e.CommandArgument)].FindControl("brickid") as TextBox;
                TextBox brickid = e.Item.FindControl("brickid") as TextBox;
                TextBox brickname = e.Item.FindControl("brickname") as TextBox;
                TextBox brickprice = e.Item.FindControl("brickprice") as TextBox;

                Debug.Print(brickid.Text + " " + brickname.Text + " " + brickprice.Text);
                int bid = Int32.Parse(brickid.Text);
                var _db = new ZVerseBrickProject.Models.ProductContext();
                Brick thebrick;
                thebrick = _db.Bricks.Find(bid);
                thebrick.BrickName = brickname.Text;
                thebrick.UnitPrice = Double.Parse(brickprice.Text);
                _db.SaveChanges();
                Response.Redirect("AdminPage.aspx", false);
                Context.ApplicationInstance.CompleteRequest();

            }

        }
       

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    if (FileUploadControl.PostedFile.ContentType == "application/javascript")
                    {
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        FileUploadControl.SaveAs(Server.MapPath("~/Uploaded_Files/") + filename);
                        StatusLabel.Text = "Upload status: File uploaded!";
                    }
                    else
                        StatusLabel.Text = "Upload status: Only Javascript files are accepted!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }

    }
}