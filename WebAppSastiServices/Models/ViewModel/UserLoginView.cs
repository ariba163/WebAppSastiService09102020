using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace WebAppSastiServices.Models.ViewModel
{
    public class UserLoginView
    {

        [Display(Name = "Display Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Display Name Required")]
        public string UserName { get; set; }


        [Required(AllowEmptyStrings = false, ErrorMessage = "Password Required")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}