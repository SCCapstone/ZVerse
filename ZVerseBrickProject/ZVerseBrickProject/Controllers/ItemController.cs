using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ZVerseBrickProject.Models;
using System.Threading.Tasks;

namespace ZVerseBrickProject.Controllers
{
    public class ItemController : ApiController
    {
        List<Item> items = new List<Item>();

        public ItemController() { }

        public ItemController(List<Item> items)
        {
            this.items = items;
        }

        public IEnumerable<Item> GetEveryItems()
        {
            return items;
        }

        public async Task<IEnumerable<Item>> GetEveryItemsAsync()
        {
            return await Task.FromResult(GetEveryItems());
        }

        public IHttpActionResult GetItem(int id)
        {
            var item = items.FirstOrDefault((p) => p.Id == id);
            if (item == null)
            {
                return NotFound();
            }
            return Ok(item);
        }

        public async Task<IHttpActionResult> GetItemAsync(int id)
        {
            return await Task.FromResult(GetItem(id));
        }
    }
}
