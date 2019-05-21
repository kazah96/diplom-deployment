using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class EmployeeLogging
    {
        public int EmployeeLoggingId { get; set; }
        public DateTime Date { get; set; }
        public bool Status { get; set; }
        public int ActionAuthorizationId { get; set; }
        public int EmployeeId { get; set; }

        public ActionAuthorization ActionAuthorization { get; set; }
        public Employee Employee { get; set; }
    }
}
