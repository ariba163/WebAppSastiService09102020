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
    
    public partial class STPConUnitOption
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public STPConUnitOption()
        {
            this.STPContract_StpContUnitOptions = new HashSet<STPContract_StpContUnitOptions>();
        }
    
        public int ID { get; set; }
        public int STPServiceTypeID { get; set; }
        public string Options { get; set; }
        public decimal Price { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<STPContract_StpContUnitOptions> STPContract_StpContUnitOptions { get; set; }
        public virtual STPServiceType STPServiceType { get; set; }
    }
}
