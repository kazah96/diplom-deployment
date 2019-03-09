using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class Network
    {
        public Network()
        {
            MonitoringInformation = new HashSet<MonitoringInformation>();
        }

        public int NetworkId { get; set; }
        public string Name { get; set; }
        public string ShortDiscription { get; set; }
        public int CompanyId { get; set; }

        public Company Company { get; set; }
        public ICollection<MonitoringInformation> MonitoringInformation { get; set; }
    }
}
