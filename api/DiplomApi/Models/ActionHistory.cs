using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class ActionHistory
    {
        public int ActionHistoryId { get; set; }
        public string Name { get; set; }
        public DateTime Date { get; set; }
        public int ActionStatusId { get; set; }
        public int DocumentId { get; set; }
        public int EmployeeId { get; set; }
        public int ActionId { get; set; }

        public Action Action { get; set; }
        public ActionStatus ActionStatus { get; set; }
        public Document Document { get; set; }
        public Employee Employee { get; set; }
    }
}
