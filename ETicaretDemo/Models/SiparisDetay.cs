//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ETicaretDemo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SiparisDetay
    {
        public int id { get; set; }
        public int RefSiparis { get; set; }
        public int RefUrun { get; set; }
        public int Adet { get; set; }
        public decimal BirimFiyat { get; set; }
    
        public virtual Siparis Siparis { get; set; }
        public virtual Urunler Urunler { get; set; }
    }
}