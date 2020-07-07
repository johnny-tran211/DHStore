using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DHFashion.Models;
using Newtonsoft.Json.Linq;

namespace DHFashion.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CheckOutDetailController : ControllerBase
    {
        private readonly AmazingDBContext _context;

        public CheckOutDetailController(AmazingDBContext context)
        {
            _context = context;
        }

        // GET: api/CheckOutDetail
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CheckOutDetail>>> GetCheckOutDetail()
        {
            return await _context.CheckOutDetail.ToListAsync();
        }
        [HttpGet("details/{id}")]
        public async Task<ActionResult<IEnumerable<CheckOutDetail>>> getDetailById(int id)
        {
            return await _context.CheckOutDetail.Where(i => i.CheckOutId == id).ToListAsync();
        }
        // GET: api/CheckOutDetail/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CheckOutDetail>> GetCheckOutDetail(int id)
        {
            var checkOutDetail = await _context.CheckOutDetail.FindAsync(id);

            if (checkOutDetail == null)
            {
                return NotFound();
            }

            return checkOutDetail;
        }

        // PUT: api/CheckOutDetail/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCheckOutDetail(int id, CheckOutDetail checkOutDetail)
        {
            if (id != checkOutDetail.Id)
            {
                return BadRequest();
            }

            _context.Entry(checkOutDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CheckOutDetailExists(id))
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

        // POST: api/CheckOutDetail
        [HttpPost("{id}")]
        public async Task<ActionResult<CheckOutDetail>> PostCheckOutDetail(int id, Object checkOutDetail)
        {
            CheckOutDetail checkOutChild = new CheckOutDetail();
            ItemsController itemsController = new ItemsController(_context);
            JArray jArray = JArray.Parse(checkOutDetail.ToString());
            for (int i = 0; i < jArray.Count; i++)
            {
                checkOutChild = new CheckOutDetail();
                checkOutChild.Id = 0;
                checkOutChild.ItemId = (int)jArray[i]["Item"]["Id"];
                checkOutChild.CheckOutId = id;
                checkOutChild.ProductName = (string)jArray[i]["Item"]["ClothesName"];
                checkOutChild.Image = (string)jArray[i]["Item"]["Image"];
                checkOutChild.Quantity = (int)jArray[i]["Quantity"];
                checkOutChild.Price = (double)jArray[i]["Item"]["Price"];
                _context.CheckOutDetail.Add(checkOutChild);
                await _context.SaveChangesAsync();

                await itemsController.PutItems((int)jArray[i]["Item"]["Id"], (Object)jArray[i]["Item"], (int)jArray[i]["Quantity"]);
            }
             
            

            return CreatedAtAction("GetCheckOutDetail", new { id = checkOutChild.Id }, checkOutChild);
        }

        // DELETE: api/CheckOutDetail/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<CheckOutDetail>> DeleteCheckOutDetail(int id)
        {
            var checkOutDetail = await _context.CheckOutDetail.FindAsync(id);
            if (checkOutDetail == null)
            {
                return NotFound();
            }

            _context.CheckOutDetail.Remove(checkOutDetail);
            await _context.SaveChangesAsync();

            return checkOutDetail;
        }

        private bool CheckOutDetailExists(int id)
        {
            return _context.CheckOutDetail.Any(e => e.Id == id);
        }
    }
}
