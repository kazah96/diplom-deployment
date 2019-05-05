namespace DiplomApi.Controllers
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Cors;
    using Microsoft.AspNetCore.Mvc;
    using Models;
    using DiplomApi.Repositories.Employee;

    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeRepository _employeeRepo;

        public EmployeeController(IEmployeeRepository employeeRepo)
        {
            _employeeRepo = employeeRepo;
        }

        [HttpGet]
        [Route("{id}")]
        [EnableCors("MyPolicy")]
        public async Task<Employee> GetByID(int id)
        {
            return await _employeeRepo.GetByID(id);
        }

        [HttpGet]
        [EnableCors("MyPolicy")]
        public async Task<IEnumerable<Employee>> GetAll (int id)
        {
            return await _employeeRepo.GetAll();
        }

        [HttpPost]
        [EnableCors("MyPolicy")]
        public async Task Post(Employee employee)
        {
            await _employeeRepo.AddEmployee(employee);
        }
    }
}