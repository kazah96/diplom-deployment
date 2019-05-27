using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class AccessLevel
    {
        public AccessLevel()
        {
            Position = new HashSet<Position>();
        }

        public int AccessLevelId { get; set; }
        public int Number { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }

        public ICollection<Position> Position { get; set; }
    }
}
