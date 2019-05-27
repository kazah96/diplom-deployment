using System;
using System.Collections.Generic;

namespace DiplomApi.Models
{
    public partial class Subdivision
    {
        public Subdivision()
        {
            Employee = new HashSet<Employee>();
        }

        public int SubdivisionId { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }

        public ICollection<Employee> Employee { get; set; }
    }
}
