using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class Position
    {
        public Position()
        {
            Employee = new HashSet<Employee>();
            RoutePoint = new HashSet<RoutePoint>();
        }

        public int PositionId { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public int? AccessLevelId { get; set; }

        public AccessLevel AccessLevel { get; set; }
        public ICollection<Employee> Employee { get; set; }
        public ICollection<RoutePoint> RoutePoint { get; set; }
    }
}
