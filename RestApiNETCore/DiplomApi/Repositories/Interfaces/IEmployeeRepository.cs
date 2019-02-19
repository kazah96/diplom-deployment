namespace DiplomApi.Repositories.Interfaces
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Models;

    public interface IEmployeeRepository
    {
        Task<Employee> GetByID(int id);
        Task<IEnumerable<Employee>> GetAll();
    }
}
