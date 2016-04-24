using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Http.Results;
using ZVerseBrickProject.Models;
using ZVerseBrickProject.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;

/*
* Name: DatabaseItemsTest.cs
* Author:
*   Ming Wong
* Description: 
    This file contains all the unit test functions regarding to adding, removing,
    or retrieving an item from the database. 
*/

namespace ZverseBrickProject.Tests
{
    [TestClass]
    public class DatabaseItemsTest
    {
        private List<Item> GetTestItems()
        {
            var testItems = new List<Item>();
            testItems.Add(new Item { Id = 1, Name = "TestItem1", Price = 1, Quantity  = 2, Category = "Duke" });
            testItems.Add(new Item { Id = 2, Name = "TestItem2", Price = 3.75M, Quantity = 3, Category = "Emory" });
            testItems.Add(new Item { Id = 3, Name = "TestItem3", Price = 16.99M, Quantity = 10, Category = "MIT" });
            testItems.Add(new Item { Id = 4, Name = "TestItem4", Price = 11.00M, Quantity = 2, Category = "Duke" });
            testItems.Add(new Item { Id = 5, Name = "TestItem5", Price = 13.00M, Quantity =12, Category = "USC" });


            return testItems;
        }

        [TestMethod]
        public void GetEveryItems_WillReturnEveryItems()
        {
            var testItems = GetTestItems();
            var controller = new ItemController(testItems);

            var result = controller.GetEveryItems() as List<Item>;
            Assert.AreEqual(testItems.Count, result.Count);
        }

        [TestMethod]
        public async Task GetEveryItemsAsync_WillReturnEveryItems()
        {
            var testItems = GetTestItems();
            var controller = new ItemController(testItems);

            var result = await controller.GetEveryItemsAsync() as List<Item>;
            Assert.AreEqual(testItems.Count, result.Count);
        }

        [TestMethod]
        public void GetItem_WillReturnRightItem()
        {
            var testItems = GetTestItems();
            var controller = new ItemController(testItems);

            var result = controller.GetItem(4) as OkNegotiatedContentResult<Item>;
            Assert.IsNotNull(result);
            Assert.AreEqual(testItems[3].Name, result.Content.Name);
        }

        [TestMethod]
        public async Task GetItemAsync_WillReturnRightItem()
        {
            var testItems = GetTestItems();
            var controller = new ItemController(testItems);

            var result = await controller.GetItemAsync(3) as OkNegotiatedContentResult<Item>;
            Assert.IsNotNull(result);
            Assert.AreEqual(testItems[2].Name, result.Content.Name);
        }

        [TestMethod]
        public void GetItemt_WillGetNotFoundItem()
        {
            var controller = new ItemController(GetTestItems());

            var result = controller.GetItem(999);
            Assert.IsInstanceOfType(result, typeof(NotFoundResult));
        }

      
    }
}
