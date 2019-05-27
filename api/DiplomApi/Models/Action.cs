using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class Action
    {
        public Action()
        {
            ActionHistory = new HashSet<ActionHistory>();
        }

        public int ActionId { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }

        public ICollection<ActionHistory> ActionHistory { get; set; }
    }
}
