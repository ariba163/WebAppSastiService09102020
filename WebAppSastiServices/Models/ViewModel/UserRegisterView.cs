using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebAppSastiServices.Models.ViewModel
{
    public class UserRegisterView
    {
        [Key]
        public int UserID { get; set; }

        [Display(Name = "Display Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Display Name Required")]
        public string UserName { get; set; }

        [Display(Name = "Email Address")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email Address Required")]
        [DataType(DataType.EmailAddress)]
        public string EmailID { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Password Required")]
        [DataType(DataType.Password)]
        [MinLength(6, ErrorMessage = "Minimum 6 Charactors Required")]
        public string Password { get; set; }

        [Display(Name = "Confirm Password")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Confirm Password and Password Do Not Match ")]
        public string ConfirmPassword { get; set; }

        [Display(Name = "Mobile Number")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^[\d]{11}$", ErrorMessage = "Entered phone format is not valid.")]
        [MaxLength(50)]
        public string Contact { get; set; }

        [Display(Name = "Address")]
        [DataType(DataType.MultilineText)]
        [MaxLength(250, ErrorMessage = "Length")]
        public string Address { get; set; }
    }
}