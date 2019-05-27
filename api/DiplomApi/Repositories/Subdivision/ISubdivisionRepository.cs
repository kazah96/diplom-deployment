namespace DiplomApi.Repositories.Subdivision
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Models;

    /// <summary>
    /// Интерфейс для Subdivision.
    /// </summary>
    public interface ISubdivisionRepository
    {
        Task<Subdivision> GetByID(int id);
        Task<IEnumerable<Subdivision>> GetAll();
    }
}
