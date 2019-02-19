namespace DiplomApi.Repositories
{
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.Extensions.Configuration;
    using Dapper;
    using Models;
    using Interfaces;

    public class EmployeeRepository : IEmployeeRepository
    {
        private readonly IConfiguration _config;

        public EmployeeRepository(IConfiguration config)
        {
            _config = config;
        }

        public IDbConnection Connection
        {
            get
            {
                return new SqlConnection("Server=DESKTOP-Q31V8AK;Database=Log;User Id=RamilLog; Password=2384548a;");
            }
        }

        public async Task<Employee> GetByID(int id)
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT ID, FirstName, LastName FROM Employee WHERE ID = @ID";
                conn.Open();
                IEnumerable<Employee> result = await conn.QueryAsync<Employee>(sQuery, new { ID = id });
                return result.FirstOrDefault();
            }
        }

        public async Task<IEnumerable<Employee>> GetAll()
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT * FROM Employee";
                conn.Open();
                IEnumerable<Employee> result = await conn.QueryAsync<Employee>(sQuery);
                result.Append(new Employee { FirstName = "SEX" });
                return result;
            }
        }
    }
}
