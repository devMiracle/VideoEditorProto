//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VideoEditorProto.Domain
{
    using System;
    using System.Collections.Generic;
    
    public partial class Project
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Project()
        {
            this.Layers = new HashSet<Layer>();
        }
    
        public string Id { get; set; }
        public string IdUser { get; set; }
        public string IdVideoCodec { get; set; }
        public string IdAudioCodec { get; set; }
        public Nullable<decimal> Width { get; set; }
        public Nullable<decimal> Height { get; set; }
        public Nullable<decimal> FPS { get; set; }
        public string Depth { get; set; }
        public string Proportions { get; set; }
        public Nullable<byte> OptimiseFrames { get; set; }
        public Nullable<double> Quality { get; set; }
        public string AudioFreq { get; set; }
        public string AudioChanells { get; set; }
        public string AudioBitrate { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public long VersionNum { get; set; }
    
        public virtual AudioCodec AudioCodec { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Layer> Layers { get; set; }
        public virtual User User { get; set; }
        public virtual VideoCodec VideoCodec { get; set; }
    }
}