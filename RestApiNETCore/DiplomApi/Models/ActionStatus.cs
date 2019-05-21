using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class ActionStatus
    {
        public ActionStatus()
        {
            ActionHistory = new HashSet<ActionHistory>();
        }

        public int ActionStatusId { get; set; }
        public int StatusCode { get; set; }
        public bool Integrity { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }

        public ICollection<ActionHistory> ActionHistory { get; set; }
    }
}
