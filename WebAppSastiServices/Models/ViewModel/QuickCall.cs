using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebAppSastiServices.Models.ViewModel
{
    public class QuickCall
    {
        [Required]
        [MaxLength(50)]
        public string Name { get; set; }

        [Required]
        [RegularExpression(@"^[\d]{11}$", ErrorMessage = "Entered phone format is not valid.")]
        public string Contact { get; set; }
    }
}