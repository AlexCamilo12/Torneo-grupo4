using Microsoft.EntityFrameworkCore;
using Torneo.App.Dominio;
namespace Torneo.App.Persistencia
{
    public class RepositorioPartido : IRepositorioPartido
    {
        private readonly DataContext _dataContext = new DataContext();

        public Partido AddPartido(Partido partido, int idLocal, int idVisitante)

        {


            var localEncontrado = _dataContext.Equipos.Find(idLocal);
            partido.Local = localEncontrado;


            var visitanteEncontrado = _dataContext.Equipos.Find(idVisitante);
            partido.Visitante = visitanteEncontrado;


            var partidoInsertado = _dataContext.Partidos.Add(partido);
            _dataContext.SaveChanges();
            return partidoInsertado.Entity;
        }

        public IEnumerable<Partido> GetAllPartidos()
        {
            var partidos = _dataContext.Partidos
                .Include(e => e.Local)
                .Include(e => e.Visitante)

                .ToList();
            return partidos;
        }
        public Partido GetPartido(int idPartido)
        {
            var partidoEncontrado = _dataContext.Partidos
            .Where(e => e.Id == idPartido)
            .Include(e => e.Local)
            .Include(e => e.Visitante)
            .FirstOrDefault();
            return partidoEncontrado;
        }
        public Partido UpdatePartido(Partido partido, int idLocal, int idVisitante)
        {
            var partidoEncontrado = GetPartido(partido.Id);
            if (partidoEncontrado != null)
            {
                partidoEncontrado.FechaHora = partido.FechaHora;
                partidoEncontrado.MarcadorLocal = partido.MarcadorLocal;
                partidoEncontrado.MarcadorVisitante = partido.MarcadorVisitante;
            }
            var localEncontrado = _dataContext.Equipos.Find(idLocal);
            var visitanteEncontrado = _dataContext.Equipos.Find(idVisitante);
            partidoEncontrado.Local = localEncontrado;
            partidoEncontrado.Visitante = visitanteEncontrado;
            _dataContext.SaveChanges();
            return partidoEncontrado;
        }
    }
}