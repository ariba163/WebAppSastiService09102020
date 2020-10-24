using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebAppSastiServices.Models.DB
{
    [MetadataType(typeof(STPOrderMetadata))]
    public partial class STPOrder

    {
    }

    public class STPOrderMetadata
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [Display(Name ="Customer Name")]
        [MaxLength(256)]
        public string Name { get; set; }
    }
}