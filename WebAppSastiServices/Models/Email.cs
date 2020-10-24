using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSastiServices.Models
{
    public class Email
    {

        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public int Age { get; set; }
        public bool isNewlyEnrolled { get; set; }
        public string Password { get; set; }
    }
}