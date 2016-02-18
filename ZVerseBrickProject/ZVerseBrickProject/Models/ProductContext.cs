using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity; 

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
    }
}