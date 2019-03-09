using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class DocumentType
    {
        public DocumentType()
        {
            Document = new HashSet<Document>();
            RoutePoint = new HashSet<RoutePoint>();
        }

        public int DocumentTypeId { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }

        public ICollection<Document> Document { get; set; }
        public ICollection<RoutePoint> RoutePoint { get; set; }
    }
}
