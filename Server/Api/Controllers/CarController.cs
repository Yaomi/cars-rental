using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/cars")]
    [ApiController]
    public class CarController : ControllerBase
    {
        public CarController()
        {

        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok( new string[] { "value1", "value2" });
        }
    }
}
