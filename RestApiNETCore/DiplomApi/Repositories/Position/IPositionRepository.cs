namespace DiplomApi.Repositories.Position
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Models;

    /// <summary>
    /// Интерфейс для Position.
    /// </summary>
    public interface IPositionRepository
    {
        Task<Position> GetByID(int id);
        Task<IEnumerable<Position>> GetAll();
    }
}