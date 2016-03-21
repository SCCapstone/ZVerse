using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ZVerseBrickProject.Models;

namespace ZVerseBrickProject.Controllers
{
    public class AddBricks
    {
        public int AddBrick(int BrickID, string BrickName, string BrickDesc, string BrickPrice, string BrickImagePath, string BrickIncript)
        {
            var myBrick = new Brick();
            myBrick.BrickID = BrickID; 
            myBrick.BrickName = BrickName;
            myBrick.Description = BrickDesc;
            myBrick.UnitPrice = Convert.ToDouble(BrickPrice);
            myBrick.ImagePath = BrickImagePath;
            myBrick.Incription = BrickIncript;


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