namespace DiplomApi.Repositories.Employee
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Models;

    /// <summary>
    /// Интерфейс для Employee.
    /// </summary>
    public interface IEmployeeRepository
    {
        Task<Employee> GetByID(int id);
        Task<IEnumerable<Employee>> GetAll();
        Task AddEmployee(Employee employee);
    }
}