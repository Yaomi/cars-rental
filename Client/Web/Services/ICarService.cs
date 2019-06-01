using System.Collections.Generic;
using System.Threading.Tasks;

namespace Web.Services
{
    public interface ICarService
    {
        Task<IEnumerable<string>> GetCars();
    }
}