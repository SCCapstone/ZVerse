using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ZVerseBrickProject.Admin
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Hide5_Click(object sender, EventArgs e)
        {
            try
            {
                Panel p = (Panel)Master.FindControl("Panel5");
                p.Visible = false;
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Task could not be completed, the following error occured: " + ex.Message;
            }

        }
        protected void Hide6_Click(object sender, EventArgs e)
        {
            try
            {
                Panel p = (Panel)Master.FindControl("Panel6");
                p.Visible = false;
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Task could not be completed, the following error occured: " + ex.Message;
            }

        }
        protected void Hide7_Click(object sender, EventArgs e)
        {
            try
            {
                Panel p = (Panel)Master.FindControl("Panel7");
                p.Visible = false;
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Task could not be completed, the following error occured: " + ex.Message;
            }

        }
        protected void Show5_Click(object sender, EventArgs e)
        {
            try
            {
                Panel q = (Panel)Master.FindControl("Panel5");
                q.Visible = true;
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Task could not be completed, the following error occured: " + ex.Message;
            }

        }
        protected void Show6_Click(object sender, EventArgs e)
        {
            try
            {
                Panel q = (Panel)Master.FindControl("Panel6");
                q.Visible = true;
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Task could not be completed, the following error occured: " + ex.Message;
            }

        }
        protected void Show7_Click(object sender, EventArgs e)
        {
            try
            {
                Panel q = (Panel)Master.FindControl("Panel7");
                q.Visible = true;
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Task could not be completed, the following error occured: " + ex.Message;
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