namespace DiplomApi.Repositories.AuthorizInfo
{
    using System.Threading.Tasks;
    using DiplomApi.Classes;

    /// <summary>
    /// Интерфейс для AuthorizInfo.
    /// </summary>
    public interface IAuthorizInfoRepository
    {
        Task<AuthorizInfo> Get(string email, string password);
    }
}
