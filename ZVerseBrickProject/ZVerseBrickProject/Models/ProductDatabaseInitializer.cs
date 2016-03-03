using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace ZVerseBrickProject.Models
{
    public class ProductDatabaseInitializer : DropCreateDatabaseIfModelChanges<ProductContext>
    {
        protected override void Seed(ProductContext context)
        {
            GetCategories().ForEach(c => context.Categories.Add(c));
            GetProducts().ForEach(p => context.Products.Add(p));
            GetItems().ForEach(i => context.Items.Add(i));
            GetBricks().ForEach(i => context.Bricks.Add(i)); 

        }


        private static List<Brick> GetBricks()
        {
            var bricks = new List<Brick>
            {
                new Brick
                {
                    BrickID = 1,
                    BrickName = "Mizzou Tradition Plaza Paved Replica",
                    Description = "Pleased to offer our alumni an opportunity to take a piece of traditions plaza back to home or office. ",
                    ImagePath="brick.jpg",
                    UnitPrice = 75.00,
                    JSPath = "newBrickRendering.js"

                },
                new Brick
                {
                    BrickID = 2,
                    BrickName = "Gamecocks Cube",
                    Description = "Proud to be Gamecocks. Hurry and purchase this wonderful brick with this 99% discount off!",                    
                    UnitPrice = 1.00,
                    ImagePath="GamecockCube.jpg",
                    JSPath = "Gamecock.js"

                },

                  new Brick
                {
                    BrickID = 3,
                    BrickName = "Clemson Wooden Plaza",
                    Description = "Proud to be Clemson Fan. Hurry and purchase this wonderful brick with this 99% discount off!",
                    UnitPrice = 1.00,
                    ImagePath="pine_blankframe.jpg",
                    JSPath = "Plaque.js"

                },

            };

            return bricks;  
        }
        

        private static List<Category> GetCategories()
        {
            var categories = new List<Category>
            {
                new Category
                {
                    CategoryID = 1,
                    CategoryName = "Clemson"
                },
                new Category
                {
                    CategoryID = 2,
                    CategoryName = "Gamecocks"
                },
                new Category
                {
                    CategoryID = 3,
                    CategoryName = "Mizzou"
                }

            };

            return categories; 
        }

        private static List<Product> GetProducts()
        {
            var products = new List<Product>
            {
                new Product
                {
                    ProductID = 1,
                    ProductName = "Clemson Memorial Stadium",
                    Description = "This is the first and only photorealistic Clemson Memorial Stadium!",
                    ImagePath="image01.jpg",
                    UnitPrice = 150.00,
                    CategoryID = 1
               },
                new Product
                {
                    ProductID = 2,
                    ProductName = "Clemson Tiger Paw Magnet",
                    Description = "A nice refrigerator magnet",
                    ImagePath="image02.jpg",
                    UnitPrice = 14.99,
                     CategoryID = 1
               },
                new Product
                {
                    ProductID = 3,
                    ProductName = "Clemson Tiger Bronze Statue",
                    Description = "Mini statue stands 4.25\" tall and 5.5\" wide!",
                    ImagePath="image03.jpg",
                    UnitPrice = 81.99,
                    CategoryID = 1
                },
                new Product
                {
                    ProductID = 4,
                    ProductName = "Clemson Tiger Head Magnet",
                    Description = "Nice addition to the fridge",
                    ImagePath="image04.jpg",
                    UnitPrice = 8.95,
                    CategoryID = 1
                },
                new Product
                {
                    ProductID = 5,
                    ProductName = "William Brice Stadium",
                    Description = "Incredible accurate model of the gamecocks home field!",
                    ImagePath="image05.jpg",
                    UnitPrice = 129.99,
                    CategoryID = 2
                },
                new Product
                {
                    ProductID = 6,
                    ProductName = "Cocky Mini Statue",
                    Description = "Cocky sitting on a brick Horseshoe bench.",
                    ImagePath="image06.jpg",
                    UnitPrice = 59.99,
                    CategoryID = 2
                },
                new Product
                {
                    ProductID = 7,
                    ProductName = "Cocky Football Ornament",
                    Description = "Decorate your Christmas Tree with this cute ornament!",
                    ImagePath="image07.jpg",
                    UnitPrice = 14.99,
                    CategoryID = 2
                },
                new Product
                {
                    ProductID = 8,
                    ProductName = "Cocky Baseball Ornament",
                    Description = "Decorate your Christmas Tree with this cute ornament!",
                    ImagePath="image08.jpg",
                    UnitPrice = 14.99,
                    CategoryID = 2
                },
                new Product
                {
                    ProductID = 9,
                    ProductName = "Cocky Basketball Ornament",
                    Description = "Decorate your Christmas Tree with this cute ornament!",
                    ImagePath="image09.jpg",
                    UnitPrice = 14.99,
                    CategoryID = 2
                },
                new Product
                {
                    ProductID = 10,
                    ProductName = "Missouri Tigers Chip Clip Magnet",
                    Description = "Display your Mizzou Tigers spirit on your fridge! ",
                    ImagePath="image10.jpg",
                    UnitPrice = 15.00,
                    CategoryID = 3
                },
                new Product
                {
                    ProductID = 11,
                    ProductName = "Mizzou Tigers Football Ornament",
                    Description = "Complement great on your tree.",
                    ImagePath="image11.jpg",
                    UnitPrice = 12.99,
                    CategoryID = 3
                },
                new Product
                {
                    ProductID = 12,
                    ProductName = "Wood Easel",
                    Description = "Great for displaying our products mounted to an 8\" x 6\" plaque",
                    ImagePath="image12.jpg",
                    UnitPrice = 8.00,
                    CategoryID = 3
                },
                new Product
                {
                    ProductID = 13,
                    ProductName = "Mizzou Tradition Plaza Paved Replica",
                    Description = "Pleased to offer our alumni an opportunity to take a piece of traditions plaza back to home or office. ",
                    ImagePath="image13.jpg",
                    UnitPrice = 75.00,
                    CategoryID = 3
                },

                new Product
                {
                    ProductID = 14,
                    ProductName = "Gamecocks Cube Brick",
                    Description = "Proud to be Gamecocks. Hurry and purchase this wonderful brick with this 99% discount off!",
                    ImagePath="image14.jpg",
                    UnitPrice = 1.00,
                    CategoryID = 1
                },

                  new Product
                {
                    ProductID = 15,
                    ProductName = "Clemson Wooden Plaza",
                    Description = "Proud to be Clemson Fan. Hurry and purchase this wonderful brick with this 99% discount off!",
                    ImagePath="image15.jpg",
                    UnitPrice = 11.00,
                    CategoryID = 2
                },

            };

            return products; 
        }

        private static List<Item> GetItems()
        {
            var items = new List<Item>
            {
                new Item
                {
                    Id = 1,
                    Quantity = 2,
                    Name = "Clemson Memorial Stadium",
                    Category = "Clemson",
                    Price = 150.00M

               },
                new Item
                {
                    Id = 2,
                    Quantity = 4,
                    Name = "Clemson Tiger Paw Magnet",
                    Price = 14.99M,
                    Category = "Clemson",
               },
                new Item
                {
                    Id = 3,
                    Quantity = 3,
                    Name = "Clemson Tiger Bronze Statue",
                    Price = 81.99M,
                    Category = "Clemson",
                },
                new Item
                {
                    Id = 4,
                    Quantity = 7,
                    Name = "Clemson Tiger Head Magnet",
                    Price = 8.95M,
                    Category = "Clemson",
                },
                new Item
                {
                    Id = 5,
                    Quantity = 2,
                    Name = "William Brice Stadium",
                    Price = 129.99M,
                    Category = "USC",
                },
                new Item
                {
                    Id = 6,
                    Quantity = 5,
                    Name = "Cocky Mini Statue",
                    Price = 59.99M,
                    Category = "USC",
                },
                new Item
                {
                    Id = 7,
                    Quantity = 3,
                    Name = "Cocky Football Ornament",
                    Price = 14.99M,
                    Category = "USC",
                },
                new Item
                {
                    Id = 8,
                    Quantity = 5,
                    Name = "Cocky Baseball Ornament",
                    Price = 14.99M,
                    Category = "USC",
                },
                new Item
                {
                    Id = 9,
                    Quantity = 3,
                    Name = "Cocky Basketball Ornament",
                    Price = 14.99M,
                    Category = "USC",
                },
                new Item
                {
                    Id = 10,
                    Quantity = 8,
                    Name = "Missouri Tigers Chip Clip Magnet",
                    Price = 15.00M,
                    Category = "Missou",
                },
                new Item
                {
                    Id = 11,
                    Quantity = 6,
                    Name = "Mizzou Tigers Football Ornament",
                    Price = 12.99M,
                    Category = "Missou",
                },
                new Item
                {
                    Id = 12,
                    Quantity = 3,
                    Name = "Wood Easel",
                    Price = 8.00M,
                    Category = "Missou",
                },
                new Item
                {
                    Id = 13,
                    Quantity = 5,
                    Name = "Mizzou Tradition Plaza Paved Replica",
                    Price = 75.00M,
                    Category = "Missou",
                },

            };

            return items;
        }
    }
}