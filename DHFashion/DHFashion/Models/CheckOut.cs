using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DHFashion.Models
{
    public class CheckOut
    {
        [Key]
        public int CheckOutID { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Date { get; set; }
        public double Price { get; set; }

    }
}
