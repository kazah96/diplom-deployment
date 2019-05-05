namespace DiplomApi.Repositories.Subdivision
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
    /// Репозиторий для работы с Subdivision.
    /// </summary>
    public class SubdivisionRepository : ISubdivisionRepository
    {
        private readonly IConfiguration _config;

        public SubdivisionRepository(IConfiguration config)
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
        /// Получение подразделения по id.
        /// </summary>
        /// <param name="subdivisionId">ID подразделения</param>
        /// <returns></returns>
        public async Task<Subdivision> GetByID(int subdivisionId)
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT SubdivisionID, Name, ShortName FROM Subdivision WHERE SubdivisionID = @SubdivisionID";
                IEnumerable<Subdivision> result = await conn.QueryAsync<Subdivision>(sQuery, new { SubdivisionId = subdivisionId });
                return result.FirstOrDefault();
            }
        }

        /// <summary>
        /// Получеине всех подразделений.
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<Subdivision>> GetAll()
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT * FROM Subdivision";
                IEnumerable<Subdivision> result = await conn.QueryAsync<Subdivision>(sQuery);
                return result;
            }
        }
    }
}
