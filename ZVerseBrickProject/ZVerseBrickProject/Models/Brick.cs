using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ZVerseBrickProject.Models
{
    public class Brick
    {
        [ScaffoldColumn(false)]
        public int BrickID { get; set; }

        public int pid { get; set; }

        [Required, StringLength(100), Display(Name = "Name")]
        public string BrickName { get; set; }

        [Required, StringLength(10000), Display(Name = "Product Description"), DataType(DataType.MultilineText)]
        public string Description { get; set; }

        public string Incription { get; set; }

        [Display(Name = "Price")]
        public double? UnitPrice { get; set; }

        public string ImagePath { get; set; }

        public string JSPath { get; set; }

        public bool isVisible { get; set; }

        public string showhide { get; set; }

        public bool isStandard { get; set; }
    }
}