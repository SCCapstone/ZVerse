using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZVerseBrickProject.Models
{
    public class Item
    {
        public int Id { get; set; }
        public int Quantity { get; set;  }
        public string Name { get; set; }
        public string Category { get; set; }
        public decimal Price { get; set; }
        
    }
}