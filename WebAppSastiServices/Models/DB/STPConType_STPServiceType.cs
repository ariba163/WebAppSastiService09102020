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
    
    public partial class STPConType_STPServiceType
    {
        public int ID { get; set; }
        public int ContractTypeID { get; set; }
        public int ServiceTypeID { get; set; }
    
        public virtual STPContractType STPContractType { get; set; }
        public virtual STPServiceType STPServiceType { get; set; }
    }
}
