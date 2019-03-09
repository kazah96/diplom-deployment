namespace DiplomApi.Repositories.Interfaces
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Models;

    /// <summary>
    /// Интерфейс для Document.
    /// </summary>
    public interface IDocumentRepository
    {
        Task<Document> GetByID(int id);
        Task<IEnumerable<Document>> GetAll();
        Task AddDocument(Document document);
    }
}