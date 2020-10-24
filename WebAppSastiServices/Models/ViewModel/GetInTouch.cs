using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebAppSastiServices.Models.ViewModel
{
    public class GetInTouch
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$", ErrorMessage = "Entered email format is not valid.")]
        public string Email { get; set; }

        [Required]
        public string Subject { get; set; }

        [Required]
        [RegularExpression(@"^[\d]{11}$", ErrorMessage = "Entered phone format is not valid.")]
        public string ContactNo { get; set; }

        [Required]
        public string Message { get; set; }
        public string RequestNumber { get; set; }


    }
}