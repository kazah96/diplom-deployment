using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class DocumentPathHistory
    {
        public int DocumentPathHistoryId { get; set; }
        public string Name { get; set; }
        public DateTime DateAndTimeOfReceipt { get; set; }
        public DateTime? DateAndTimeOfDispatch { get; set; }
        public int DocumentId { get; set; }
        public int EmployeeId { get; set; }

        public Document Document { get; set; }
        public Employee Employee { get; set; }
    }
}
