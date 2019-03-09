using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class RoutePoint
    {
        public int RoutePointId { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string StageNumber { get; set; }
        public int DocumentTypeId { get; set; }
        public int PositionId { get; set; }
        public int ActionId { get; set; }

        public Action Action { get; set; }
        public DocumentType DocumentType { get; set; }
        public Position Position { get; set; }
    }
}
