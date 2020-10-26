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
    
    public partial class STPServicesFuelType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public STPServicesFuelType()
        {
            this.STPServiceProductItems = new HashSet<STPServiceProductItem>();
            this.STPServices = new HashSet<STPService>();
            this.TRNCustomerOrders = new HashSet<TRNCustomerOrder>();
        }
    
        public int ID { get; set; }
        public int STPServiceTypeID { get; set; }
        public string Label { get; set; }
        public string Options { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<STPServiceProductItem> STPServiceProductItems { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<STPService> STPServices { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TRNCustomerOrder> TRNCustomerOrders { get; set; }
        public virtual STPServiceType STPServiceType { get; set; }
        public virtual STPServiceType STPServiceType1 { get; set; }
    }
}
