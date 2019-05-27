using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class ActionAuthorization
    {
        public ActionAuthorization()
        {
            EmployeeLogging = new HashSet<EmployeeLogging>();
        }

        public int ActionAuthorizationId { get; set; }
        public int ActionCode { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }

        public ICollection<EmployeeLogging> EmployeeLogging { get; set; }
    }
}
