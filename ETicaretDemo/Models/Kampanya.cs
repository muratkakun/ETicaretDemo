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
    
    public partial class Kampanya
    {
        public int id { get; set; }
        public string KBaslik { get; set; }
        public string KAciklama { get; set; }
        public string KResimYolu { get; set; }
        public Nullable<int> RefUrun { get; set; }
    
        public virtual Urunler Urunler { get; set; }
    }
}
