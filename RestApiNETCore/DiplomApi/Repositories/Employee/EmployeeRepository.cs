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

    /// <summary>
    /// Репозиторий для работы с Employee.
    /// </summary>
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
                return new SqlConnection("Server=DESKTOP-Q31V8AK;Database=DiplomDatabase;Trusted_Connection=True;");
            }
        }

        /// <summary>
        /// Получение сотрудников по id.
        /// </summary>
        /// <param name="employeeId">ID сотрудника</param>
        /// <returns></returns>
        public async Task<Employee> GetByID(int employeeId)
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT EmployeeID, Name, Surname FROM Employee WHERE EmployeeID = @EmployeeID";
                IEnumerable<Employee> result = await conn.QueryAsync<Employee>(sQuery, new { EmployeeId = employeeId });
                return result.FirstOrDefault();
            }
        }

        /// <summary>
        /// Получеине всех сотрудников.
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<Employee>> GetAll()
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT * FROM Employee";
                IEnumerable<Employee> result = await conn.QueryAsync<Employee>(sQuery);
                return result;
            }
        }
    }
}