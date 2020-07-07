using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DHFashion.Models
{
    public class Items
    {
        [Key]
        public int Id { get; set; }
        public string ClothesName { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public string Type { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public string CPU { get; set; }
        public string RAM { get; set; }
        public string Screen { get; set; }
        public string OS { get; set; }

    }
}
