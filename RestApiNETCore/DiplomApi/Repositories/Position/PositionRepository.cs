namespace DiplomApi.Repositories.Position
{
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.Extensions.Configuration;
    using Dapper;
    using Models;

    /// <summary>
    /// Репозиторий для работы с Position.
    /// </summary>
    public class PositionRepository : IPositionRepository
    {
        private readonly IConfiguration _config;

        public PositionRepository(IConfiguration config)
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
        /// Получение должностей по id.
        /// </summary>
        /// <param name="positionId">ID должности</param>
        /// <returns></returns>
        public async Task<Position> GetByID(int positionId)
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT PositionID, Name, ShortDescription FROM Position WHERE PositionID = @PositionID";
                IEnumerable<Position> result = await conn.QueryAsync<Position>(sQuery, new { PositionId = positionId });
                return result.FirstOrDefault();
            }
        }

        /// <summary>
        /// Получеине всех должностей.
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<Position>> GetAll()
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT * FROM Position";
                IEnumerable<Position> result = await conn.QueryAsync<Position>(sQuery);
                return result;
            }
        }
    }
}