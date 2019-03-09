using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class Action
    {
        public Action()
        {
            RoutePoint = new HashSet<RoutePoint>();
        }

        public int ActionId { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }

        public ICollection<RoutePoint> RoutePoint { get; set; }
    }
}
