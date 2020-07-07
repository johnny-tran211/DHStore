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
    public class CheckOutController : ControllerBase
    {
        private readonly AmazingDBContext _context;

        public CheckOutController(AmazingDBContext context)
        {
            _context = context;
        }

        // GET: api/CheckOut
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CheckOut>>> GetCheckOut()
        {
            return await _context.CheckOut.ToListAsync();
        }

        // GET: api/CheckOut/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CheckOut>> GetCheckOut(int id)
        {
            var checkOut = await _context.CheckOut.FindAsync(id);

            if (checkOut == null)
            {
                return NotFound();
            }

            return checkOut;
        }
        [HttpGet("username/{id}")]
        public async Task<ActionResult<IEnumerable<CheckOut>>> getUser(string id)
        {
            return await _context.CheckOut.Where(u => u.Email == id).OrderByDescending(ord => ord.CheckOutID).ToListAsync();
        }
        // PUT: api/CheckOut/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCheckOut(int id, CheckOut checkOut)
        {
            if (id != checkOut.CheckOutID)
            {
                return BadRequest();
            }

            _context.Entry(checkOut).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CheckOutExists(id))
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

        // POST: api/CheckOut
        [HttpPost]
        public async Task<ActionResult<CheckOut>> PostCheckOut(Object checkOut)
        {
            
            CheckOut checkOutFix = new CheckOut();
            checkOutFix.CheckOutID = (int)JObject.Parse(checkOut.ToString())["CheckOutID"];
            checkOutFix.Email = (string)JObject.Parse(checkOut.ToString())["Email"];
            checkOutFix.Address = (string)JObject.Parse(checkOut.ToString())["Address"];
            checkOutFix.Phone = (string)JObject.Parse(checkOut.ToString())["Phone"];
            checkOutFix.Date = (string)JObject.Parse(checkOut.ToString())["Date"];
            checkOutFix.Price = (double)JObject.Parse(checkOut.ToString())["Price"];
            _context.CheckOut.Add(checkOutFix);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCheckOut", new { id = checkOutFix.CheckOutID }, checkOutFix.CheckOutID);
        }

        // DELETE: api/CheckOut/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<CheckOut>> DeleteCheckOut(int id)
        {
            var checkOut = await _context.CheckOut.FindAsync(id);
            if (checkOut == null)
            {
                return NotFound();
            }

            _context.CheckOut.Remove(checkOut);
            await _context.SaveChangesAsync();

            return checkOut;
        }

        private bool CheckOutExists(int id)
        {
            return _context.CheckOut.Any(e => e.CheckOutID == id);
        }
    }
}
