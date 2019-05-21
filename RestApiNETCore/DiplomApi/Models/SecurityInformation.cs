using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class SecurityInformation
    {
        public int SecurityInformationId { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string Hash { get; set; }
        public int DocumentId { get; set; }

        public Document Document { get; set; }
    }
}
