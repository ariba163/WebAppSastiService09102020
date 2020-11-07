using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAppSastiServices.Models.DB
{

    [MetadataType(typeof(STPProductBrandMetadata))]
    public partial class STPProductBrand
    {
    }

    public class STPProductBrandMetadata
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public string Name { get; set; }




    }
}