using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace K8s.Workshop.Web.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly RestRepository _restRepository;

        public IndexModel(ILogger<IndexModel> logger, RestRepository restRepository)
        {
            _logger = logger;
            _restRepository = restRepository;
        }

        public async Task OnGet()
        {
            var weatherForecasts = await _restRepository.GetWeatherForecasts();

            ViewData.Add("weatherForecasts", weatherForecasts);
        }
    }
}
