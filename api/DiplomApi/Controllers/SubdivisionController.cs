namespace DiplomApi.Controllers
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Cors;
    using Microsoft.AspNetCore.Mvc;
    using Models;
    using DiplomApi.Repositories.Subdivision;

    [Route("api/[controller]")]
    [ApiController]
    public class SubdivisionController : ControllerBase
    {
        private readonly ISubdivisionRepository _subdivisionRepo;

        public SubdivisionController(ISubdivisionRepository subdivisionRepo)
        {
            _subdivisionRepo = subdivisionRepo;
        }

        [HttpGet]
        [Route("{id}")]
        [EnableCors("MyPolicy")]
        public async Task<Subdivision> GetByID(int id)
        {
            return await _subdivisionRepo.GetByID(id);
        }

        [HttpGet]
        [EnableCors("MyPolicy")]
        public async Task<IEnumerable<Subdivision>> GetAll(int id)
        {
            return await _subdivisionRepo.GetAll();
        }
    }
}
