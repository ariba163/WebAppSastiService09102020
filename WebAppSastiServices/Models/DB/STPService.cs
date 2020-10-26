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
    
    public partial class STPService
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public STPService()
        {
            this.TRNCustomerOrders_STPServices = new HashSet<TRNCustomerOrders_STPServices>();
        }
    
        public int ID { get; set; }
        public string ServiceName { get; set; }
        public string ServiceDescrption { get; set; }
        public int STPServiceTypeID { get; set; }
        public bool IsAvailible { get; set; }
        public System.DateTime CreatedDateTime { get; set; }
        public int FuelTypeId { get; set; }
        public int UnitTypeId { get; set; }
        public decimal ServiceRate { get; set; }
    
        public virtual STPServicesFuelType STPServicesFuelType { get; set; }
        public virtual STPServicesUnitType STPServicesUnitType { get; set; }
        public virtual STPServiceType STPServiceType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TRNCustomerOrders_STPServices> TRNCustomerOrders_STPServices { get; set; }
    }
}
