using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using ZVerseBrickProject.Models;

namespace ZVerseBrickProject.Controllers
{
    public class AddBricks
    {
        public int AddBrick(int pid, string BrickName, string BrickDesc, string BrickIncript, string BrickPrice, string BrickImagePath, string BrickJSPath, bool BrickIsVisible, string Brickshowhide , bool BrickisStandard, string text1, string text2, string text3)
        {

            //Debug.WriteLine("addbrick: js path is " + BrickJSPath);
            //Debug.WriteLine("addbrick: showhide is " + Brickshowhide);

            var myBrick = new Brick();
            //myBrick.BrickID = BrickID; 
            myBrick.pid = pid; 
            myBrick.BrickName = BrickName;
            myBrick.Description = BrickDesc;
            myBrick.Incription = BrickIncript;
            myBrick.UnitPrice = Convert.ToDouble(BrickPrice);
            myBrick.ImagePath = BrickImagePath;
            myBrick.JSPath = BrickJSPath;
            myBrick.isVisible = BrickIsVisible;
            myBrick.showhide = Brickshowhide; 
            myBrick.isStandard = BrickisStandard;
            myBrick.tb1 = text1;
            myBrick.tb2 = text2;
            myBrick.tb3 = text3;



            using (ProductContext _db = new ProductContext())
            {
                _db.Bricks.Add(myBrick);
                _db.SaveChanges();
            }

            int id = myBrick.BrickID; 
            return id;
        }

    }
}