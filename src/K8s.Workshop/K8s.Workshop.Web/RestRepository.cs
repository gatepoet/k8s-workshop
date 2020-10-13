using System.Collections.Generic;
using System.Threading.Tasks;
using K8s.Workshop.Api;
using Microsoft.Extensions.Configuration;
using RestSharp;

namespace K8s.Workshop.Web
{
    public class RestRepository
    {
        private readonly IRestClient _restClient;
        private readonly IConfiguration _configuration;

        public RestRepository(IRestClient restClient, IConfiguration configuration)
        {
            _restClient = restClient;
            _configuration = configuration;
        }

        public async Task<WeatherForecast[]> GetWeatherForecasts()
        {
            var baseUrl = _configuration.GetValue <string>("ApiUrl");

            var request = new RestRequest($"{baseUrl}/Weatherforecast", Method.GET,DataFormat.Json);

            var weatherForecasts = await _restClient.GetAsync<List<WeatherForecast>>(request);

            return weatherForecasts.ToArray();
        }
    }
}
