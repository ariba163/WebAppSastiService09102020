using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAppSastiServices.Models.DB
{

    [MetadataType(typeof(STPServiceMetadata))]
    public partial class STPService
    {
    }

    public class STPServiceMetadata
    {
        [Key]
        public int ID { get; set; }
        [Required]
        public string ServiceName { get; set; }
        public string ServiceDescrption { get; set; }
        [Required]
        public int FuelTypeId { get; set; }
        [Required]
        public int UnitTypeId { get; set; }
        [Required]
        public decimal ServiceRate { get; set; }




    }
}