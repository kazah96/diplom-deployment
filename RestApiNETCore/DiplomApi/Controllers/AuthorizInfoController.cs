namespace DiplomApi.Controllers
{
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Cors;
    using Microsoft.AspNetCore.Mvc;
    using DiplomApi.Classes;
    using DiplomApi.Repositories.AuthorizInfo;

    [Route("api/[controller]")]
    [ApiController]
    public class AuthorizInfoController : ControllerBase
    {
        private readonly IAuthorizInfoRepository _authorizInfoRepo;

        public AuthorizInfoController(IAuthorizInfoRepository authorizInfoRepo)
        {
            _authorizInfoRepo = authorizInfoRepo;
        }

        [HttpGet]
        [Route("{email}/{password}")]
        [EnableCors("MyPolicy")]
        public async Task<AuthorizInfo> Get(string email, string password)
        {
            return await _authorizInfoRepo.Get(email, password);
        }
    }
}
