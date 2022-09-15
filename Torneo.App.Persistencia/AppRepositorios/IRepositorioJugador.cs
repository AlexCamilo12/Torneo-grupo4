using Torneo.App.Dominio;
namespace Torneo.App.Persistencia
{
    public interface IRepositorioJugador
    {
        public Jugador AddJugador(Jugador jugador, int idMunicipio, int idDT);
        public IEnumerable<Jugador> GetAllJugadores();
    }
}