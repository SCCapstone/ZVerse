using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ZVerseBrickProject.Models;

namespace ZVerseBrickProject.Controllers
{
    public class AddProducts
    {
        public int AddProduct(string ProductName, string ProductDesc, string ProductPrice, string ProductCategory, string ProductImagePath, string ProductIncript)
        {
            var myProduct = new Product();
            myProduct.ProductName = ProductName;
            myProduct.Description = ProductDesc;
            myProduct.UnitPrice = Convert.ToDouble(ProductPrice);
            myProduct.ImagePath = ProductImagePath;
            myProduct.CategoryID = Convert.ToInt32(ProductCategory);
            myProduct.Incription = ProductIncript;


            using (ProductContext _db = new ProductContext())
            {
                _db.Products.Add(myProduct);
                _db.SaveChanges();
            }

            int id = myProduct.ProductID; 
            return id;
        }

    }
}