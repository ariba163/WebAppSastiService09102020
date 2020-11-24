//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebAppSastiServices.Models.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class STPProductList
    {
        public int ID { get; set; }
        public Nullable<int> STPProductTypeID { get; set; }
        public string ProductName { get; set; }
        public Nullable<int> ProductSKU { get; set; }
        public string ProductShortDescription { get; set; }
        public Nullable<long> ProductPrice { get; set; }
        public Nullable<int> Stock { get; set; }
        public string ImageOne { get; set; }
        public string ImageTwo { get; set; }
        public string ImageThree { get; set; }
        public string ImageFour { get; set; }
        public Nullable<bool> isDiscount { get; set; }
        public Nullable<long> DiscountedAmount { get; set; }
        public string LongDescription { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
    
        public virtual STPProductType STPProductType { get; set; }
    }
}
