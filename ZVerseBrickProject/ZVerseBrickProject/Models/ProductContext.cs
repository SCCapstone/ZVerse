﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

/*
* Name: ProductContext.cs
* Author:
*   Ming Wong
* Description: 
    This file is used to retreive objects from different tables in the database. 
*/
namespace ZVerseBrickProject.Models
{
    public class ProductContext : DbContext
    {
        public ProductContext() : base("ZVerseBrickProject")
        {

        }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Item> Items { get; set; }
        public DbSet<CartItem> ShoppingCartItems { get; set; }
        public DbSet<Brick> Bricks { get; set; }
    }
}