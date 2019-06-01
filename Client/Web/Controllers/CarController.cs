using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web.Services;

namespace Web.Controllers
{
    public class CarController : Controller
    {
        private readonly ICarService carService;

        public CarController(ICarService carService)
        {
            this.carService = carService;
        }

        public async Task<IActionResult> List()
        {
            var cars = await carService.GetCars();
            return View(cars);
        }
    }
}