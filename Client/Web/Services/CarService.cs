using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using Web.Models;

namespace Web.Services
{
    public class CarService : ICarService
    {
        private readonly WebSettings webSettings;

        public CarService(IOptions<WebSettings> settingsOptions)
        {
            webSettings = settingsOptions.Value;
        }

        public async Task<IEnumerable<string>> GetCars()
        {
            var uri = new Uri(
                new Uri(webSettings.CarServiceUrl, UriKind.Absolute),
                new Uri("api/cars", UriKind.Relative));
            try
            {
                using (var client = new HttpClient())
                {
                    var response = await client.GetAsync(uri)
                        .ConfigureAwait(false);
                    return await response.Content
                        .ReadAsAsync<IEnumerable<string>>()
                        .ConfigureAwait(false);
                }
            }
            catch
            {
                Debug.WriteLine("Failed to get cars from car service");
                return null;
            }
        }
    }
}