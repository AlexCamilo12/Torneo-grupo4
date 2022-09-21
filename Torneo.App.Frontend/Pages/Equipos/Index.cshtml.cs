using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Torneo.App.Dominio;
using Torneo.App.Persistencia;

namespace Torneo.App.Frontend.Pages.Equipos
{
    public class IndexModel : PageModel
    {
        private readonly IRepositorioEquipo _repoEquipo;
        public IEnumerable<Equipo> equipos { get; set; }
        public IndexModel(IRepositorioEquipo repoEquipo)
        {
            _repoEquipo = repoEquipo;
        }
        public void OnGet()
        {
            equipos = _repoEquipo.GetAllEquipos();
        }
    }
}