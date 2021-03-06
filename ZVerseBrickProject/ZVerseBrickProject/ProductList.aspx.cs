﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZVerseBrickProject.Models;
using System.Web.ModelBinding;

/*
* Name: ProductList.aspx.cs
* Author:
*   Ming Wong
* Description: 
    All the functions used to obtain the product 
    and categories in the product list page. 
*/

namespace ZVerseBrickProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /* Obtain all the school categories of the products */ 
        public IQueryable<Category> GetCategories()
        {
            var _db = new ZVerseBrickProject.Models.ProductContext();
            IQueryable<Category> query = _db.Categories;
            return query;
        }

        /* Obtain all the products in the database. If category is selected ,
        obtain only products within that school category */ 
        public IQueryable<Product> GetProducts([QueryString("id")] int? categoryId)
        {
            var _db = new ZVerseBrickProject.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (categoryId.HasValue && categoryId > 0)
            {
                query = query.Where(p => p.ProductID < 16 && p.CategoryID == categoryId);
            }
            else
            {
                query = query.Where(p => p.ProductID < 16);
            }
            return query;
        }


    }
}