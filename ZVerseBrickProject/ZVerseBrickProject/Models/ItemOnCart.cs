using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations; 

namespace ZVerseBrickProject.Models
{
    public class ItemOnCart
    {
        [Key]
        public string ItemId { get; set; }

        public string CartId { get; set; }

        public int Quantity { get; set;  }

        public System.DateTime CreationDate { get; set;  }

        public int ProductId { get; set; }

        public virtual Product Product { get; set;  }

    }
}