namespace DiplomApi.Repositories.Document
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
    /// Репозиторий для работы с Document.
    /// </summary>
    public class DocumentRepository : IDocumentRepository
    {
        private readonly IConfiguration _config;

        public DocumentRepository(IConfiguration config)
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
        /// Получение документа по id.
        /// </summary>
        /// <param name="documentID">id документа</param>
        /// <returns></returns>
        public async Task<Document> GetByID(int documentID)
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT DocumentID, [Name], [ShortDiscription], [Path], [Status], [Size], [EditsAndChanges], [DocumentTypeID] FROM Document WHERE [DocumentID] = @DocumentID";
                IEnumerable<Document> result = await conn.QueryAsync<Document>(sQuery, new Document { DocumentId = documentID });
                return result.FirstOrDefault();
            }
        }

        /// <summary>
        /// Получение всех документов.
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<Document>> GetAll()
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = "SELECT * FROM Document";
                IEnumerable<Document> result = await conn.QueryAsync<Document>(sQuery);
                return result;
            }
        }

        /// <summary>
        /// Добавление документа.
        /// </summary>
        /// <param name="document">Документ для добавления</param>
        /// <returns></returns>
        public async Task AddDocument(Document document)
        {
            using (IDbConnection conn = Connection)
            {
                string sQuery = @"INSERT INTO Document(Name, ShortDiscription, Path, Status, Size, EditsAndChanges, DocumentTypeID) VALUES (@Name, @ShortDiscription, @Path, @Status, @Size, @EditsAndChanges, @DocumentTypeID)";
                var result = await conn.ExecuteAsync(sQuery, 
                    new Document
                    {
                        Name = document.Name,
                        ShortDiscription = document.ShortDiscription,
                        Path = document.Path,
                        Status = document.Status,
                        Size = document.Size,
                        EditsAndChanges = document.EditsAndChanges,
                        DocumentTypeId = document.DocumentTypeId
                    });
            }
        }
    }
}