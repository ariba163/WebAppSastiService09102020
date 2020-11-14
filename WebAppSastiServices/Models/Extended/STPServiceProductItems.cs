using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAppSastiServices.Models.DB
{

    [MetadataType(typeof(STPServiceProductItemMetadata))]
    public partial class STPServiceProductItem
    {
    }

    public class STPServiceProductItemMetadata
    {
        [Key]
        public int ID { get; set; }
        [Required]
        public string ServiceProductName { get; set; }
        public string ServiceProductDescription { get; set; }
        [Required]
        public int FuelTypeId { get; set; }
        [Required]
        public int UnitTypeId { get; set; }
        [Required]
        public string ServiceModelNo { get; set; }
        [Required]
        public int STPProductBrandID { get; set; }
        [Required]
        public decimal CostPrice { get; set; }
        [Required]
        public decimal SellingPrice { get; set; }
}
}