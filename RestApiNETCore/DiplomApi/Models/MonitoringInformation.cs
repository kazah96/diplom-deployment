using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class MonitoringInformation
    {
        public int MonitoringInformationId { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public int DocumentId { get; set; }
        public int NetworkId { get; set; }

        public Document Document { get; set; }
        public Network Network { get; set; }
    }
}
