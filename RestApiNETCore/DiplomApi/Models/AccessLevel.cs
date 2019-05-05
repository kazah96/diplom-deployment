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
        public int AccessNumber { get; set; }
        public string AccessName { get; set; }

        public ICollection<Position> Position { get; set; }
    }
}
