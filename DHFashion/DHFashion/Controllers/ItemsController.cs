using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DHFashion.Models;
using System.Collections;
using Newtonsoft.Json.Linq;

namespace DHFashion.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemsController : ControllerBase
    {
        private readonly AmazingDBContext _context;

        public ItemsController(AmazingDBContext context)
        {
            _context = context;
        }

        // GET:  api/Items
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Items>>> GetItems()
        {
            return await _context.Items.AsNoTracking().ToListAsync();
        }
        [HttpGet("iphoneSearch/{id}")]
        public async Task<ActionResult<IEnumerable<Items>>> getIphoneBySearch(string id)
        {
            return await _context.Items.Where(n => n.ClothesName.Contains(id) && n.Type == "Iphone").ToListAsync();
        }
        [HttpGet("macbookSearch/{id}")]
        public async Task<ActionResult<IEnumerable<Items>>> getMacbookBySearch(string id)
        {
            return await _context.Items.Where(n => n.ClothesName.Contains(id) && n.Type == "Macbook").ToListAsync();
        }
        [HttpGet("iphone")]
        public async Task<ActionResult<IEnumerable<Items>>> GetIphone()
        {
            return await _context.Items.Where(t => t.Type == "Iphone").ToListAsync();
        }
        [HttpGet("macbook")]
        public async Task<ActionResult<IEnumerable<Items>>> GetMacbook()
        {
            return await _context.Items.Where(t => t.Type == "Macbook").ToListAsync();
        }
        // GET: api/Items/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Items>> GetItems(int id)
        {
            var items = await _context.Items.FindAsync(id);
            if (items == null)
            {
                return NotFound();
            }

            return items;
        }

        // PUT: api/Items/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutItems(int id, Object item, int Quantity)
        {
            Items items = new Items();
            items.Id = (int)JObject.Parse(item.ToString())["Id"];
            items.ClothesName = (string)JObject.Parse(item.ToString())["ClothesName"];
            items.Price = (double)JObject.Parse(item.ToString())["Price"];
            items.Quantity = (int)JObject.Parse(item.ToString())["Quantity"] - Quantity;
            items.Type = (string)JObject.Parse(item.ToString())["Type"];
            items.Image = (string)JObject.Parse(item.ToString())["Image"];
            items.Description = (string)JObject.Parse(item.ToString())["Description"];
            items.CPU = (string)JObject.Parse(item.ToString())["CPU"];
            items.RAM = (string)JObject.Parse(item.ToString())["RAM"];
            items.Screen = (string)JObject.Parse(item.ToString())["Screen"];
            items.OS = (string)JObject.Parse(item.ToString())["OS"];
            if (id != items.Id)
            {
                return BadRequest();
            }

            _context.Entry(items).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ItemsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Items
        [HttpPost]
        public async Task<ActionResult<Items>> PostItems(Items items)
        {
            _context.Items.Add(items);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetItems", new { id = items.Id }, items);
        }

        // DELETE: api/Items/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Items>> DeleteItems(int id)
        {
            var items = await _context.Items.FindAsync(id);
            if (items == null)
            {
                return NotFound();
            }

            _context.Items.Remove(items);
            await _context.SaveChangesAsync();

            return items;
        }

        private bool ItemsExists(int id)
        {
            return _context.Items.Any(e => e.Id == id);
        }
    }
}
