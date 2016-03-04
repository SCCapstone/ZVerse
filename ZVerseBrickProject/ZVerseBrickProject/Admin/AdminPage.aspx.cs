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
            return query;
        }

        //This function will set the brickmodel visible property to 
        // be false to hide the model from tab and catalogue
        protected void Hide_Click(object sender, CommandEventArgs e)
        {
            int brickid = Int32.Parse(e.CommandArgument.ToString());
            var _db = new ZVerseBrickProject.Models.ProductContext();
            Brick thebrick; 
            thebrick = _db.Bricks.Find(brickid);
            thebrick.isVisible = false;
            _db.SaveChanges(); 

        }

        //This function will set the brickmodel visible property to 
        // be true to reveal the model on the tab and catalogue. 
        protected void Show_Click(object sender, CommandEventArgs e)
        {
            int brickid = Int32.Parse(e.CommandArgument.ToString());
            var _db = new ZVerseBrickProject.Models.ProductContext();
            Brick thebrick;
            thebrick = _db.Bricks.Find(brickid);
            thebrick.isVisible = true;
            _db.SaveChanges();

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