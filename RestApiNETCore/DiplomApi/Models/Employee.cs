using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class Employee
    {
        public Employee()
        {
            ActionHistory = new HashSet<ActionHistory>();
            EmployeeLogging = new HashSet<EmployeeLogging>();
        }

        public int EmployeeId { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string MiddleName { get; set; }
        public string TelephoneNumber { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int PositionId { get; set; }
        public int SubdivisionId { get; set; }
        public int CompanyId { get; set; }

        public Company Company { get; set; }
        public Position Position { get; set; }
        public Subdivision Subdivision { get; set; }
        public ICollection<ActionHistory> ActionHistory { get; set; }
        public ICollection<EmployeeLogging> EmployeeLogging { get; set; }
    }
}
