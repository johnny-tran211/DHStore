using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DHFashion.Models
{
    public class CheckOutDetail
    {
        [Key]
        public int Id { get; set; }
        public int ItemId { get; set; }
        public int CheckOutId { get; set; }
        public string ProductName { get; set; }
        public string Image { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }


    }
}
