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
        public int AddBrick(int BrickID, string BrickName, string BrickDesc, string BrickIncript, string BrickPrice, string BrickImagePath, string BrickJSPath, bool BrickIsVisible, string Brickshowhide , bool BrickisStandard)
        {

            //Debug.WriteLine("addbrick: js path is " + BrickJSPath);
            //Debug.WriteLine("addbrick: showhide is " + Brickshowhide);

            var myBrick = new Brick();
            myBrick.BrickID = BrickID; 
            myBrick.BrickName = BrickName;
            myBrick.Description = BrickDesc;
            myBrick.Incription = BrickIncript;
            myBrick.UnitPrice = Convert.ToDouble(BrickPrice);
            myBrick.ImagePath = BrickImagePath;
            myBrick.JSPath = BrickJSPath;
            myBrick.isVisible = BrickIsVisible;
            myBrick.showhide = Brickshowhide; 
            myBrick.isStandard = BrickisStandard;



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