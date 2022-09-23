using Torneo.App.Dominio;
using Torneo.App.Persistencia;
namespace Torneo.App.Consola
{
    class Program
    {
        private static IRepositorioMunicipio _repoMunicipio = new RepositorioMunicipio();
        private static IRepositorioDT _repoDT = new RepositorioDT();
        private static IRepositorioEquipo _repoEquipo = new RepositorioEquipo();
        private static IRepositorioPosicion _repoPosicion = new RepositorioPosicion();
        private static IRepositorioJugador _repoJugador = new RepositorioJugador();
        private static IRepositorioPartido _repoPartido = new RepositorioPartido();

        static void Main(string[] args)
        {
            int opcion = 0;
            do
            {
                Console.WriteLine("--------Menú-------\n");

                Console.WriteLine("1. Insertar Municipio");
                Console.WriteLine("2. Mostrar Municipios\n");

                Console.WriteLine("3. Insertar DT");
                Console.WriteLine("4. Mostrar DTs\n");

                Console.WriteLine("5. Insertar Equipo");
                Console.WriteLine("6. Mostrar Equipos\n");

                Console.WriteLine("7. Insertar Posicion");
                Console.WriteLine("8. Mostrar Posiciones\n");

                Console.WriteLine("9. Insertar Jugador");
                Console.WriteLine("10. Mostrar Jugadores\n");

                Console.WriteLine("11. Insertar Partido");
                Console.WriteLine("12. Mostrar Partidos\n");

                Console.WriteLine("0. Salir\n");
                Console.WriteLine("Seleccione la opcion deseada");

                opcion = Int32.Parse(Console.ReadLine());
                switch (opcion)
                {
                    case 1:
                        AddMunicipio();
                        break;
                    case 2:
                        GetAllMunicipios();
                        break;


                    case 3:
                        AddDT();
                        break;
                    case 4:
                        GetAllDTs();
                        break;


                    case 5:
                        AddEquipo();
                        break;
                    case 6:
                        GetAllEquipos();
                        break;


                    case 7:
                        AddPosicion();
                        break;
                    case 8:
                        GetAllPociciones();
                        break;


                    case 9:
                        AddJugador();
                        break;
                    case 10:
                        GetAllJugadores();
                        break;


                    case 11:
                        AddPartido();
                        break;
                    case 12:
                        GetAllPartidos();
                        break;
                }
            } while (opcion != 0);
        }

        private static void AddMunicipio()
        {
            Console.WriteLine("Ingrese el nombre del Municipio");
            string nombre = Console.ReadLine();
            var municipio = new Municipio
            {
                Nombre = nombre,
            };
            _repoMunicipio.AddMunicipio(municipio);
        }

        private static void AddDT()
        {
            Console.WriteLine("Ingrese el nombre del DT");
            string nombre = Console.ReadLine();
            Console.WriteLine("Ingrese el documento del DT");
            string documento = Console.ReadLine();
            Console.WriteLine("Ingrese el telefono del DT");
            string telefono = Console.ReadLine();
            var directorTecnico = new DirectorTecnico
            {
                Nombre = nombre,
                Documento = documento,
                Telefono = telefono,
            };
            _repoDT.AddDT(directorTecnico);
        }

        private static void AddEquipo()
        {
            Console.WriteLine("Ingrese el nombre del Equipo");
            string nombre = Console.ReadLine();
            Console.WriteLine("Ingrese el id del municipio");
            int idMunicipio = Int32.Parse(Console.ReadLine());
            Console.WriteLine("Ingrese el id del DT");
            int idDT = Int32.Parse(Console.ReadLine());

            var equipo = new Equipo
            {
                Nombre = nombre,
            };
            _repoEquipo.AddEquipo(equipo, idMunicipio, idDT);
        }

        private static void AddPosicion()
        {
            Console.WriteLine("Ingrese el nombre de la posicion");
            string nombre = Console.ReadLine();
            var posicion = new Posicion
            {
                Nombre = nombre,
            };
            _repoPosicion.AddPosicion(posicion);
        }

        private static void AddJugador()
        {
            Console.WriteLine("Ingrese el nombre del jugador");
            string nombre = Console.ReadLine();
            Console.WriteLine("Ingrese el número del jugador");
            int numero = Int32.Parse(Console.ReadLine());
            Console.WriteLine("Ingrese id del equipo");
            int idEquipo = Int32.Parse(Console.ReadLine());
            Console.WriteLine("Ingrese id de la posicion");
            int idPosicion = Int32.Parse(Console.ReadLine());

            var jugador = new Jugador
            {
                Nombre = nombre,
                Numero = numero,
            };
            _repoJugador.AddJugador(jugador, idEquipo, idPosicion);
        }

        private static void AddPartido()
        {
            DateTime fechaHora = DateTime.Now;

            Console.WriteLine("Ingrese el Id del Equipo Local");
            int idLocal = Int32.Parse(Console.ReadLine());

            Console.WriteLine("Ingrese Marcador del Equipo Local");
            int marcadorLocal = Int32.Parse(Console.ReadLine());

            Console.WriteLine("Ingrese el Id del Equipo Visitante");
            int idVisitante = Int32.Parse(Console.ReadLine());

            Console.WriteLine("Ingrese Marcador del Equipo Visitante");
            int marcadorVisitante = Int32.Parse(Console.ReadLine());

            var partido = new Partido

            {
                FechaHora = fechaHora,
                MarcadorLocal = marcadorLocal,
                MarcadorVisitante = marcadorVisitante,

            };
            _repoPartido.AddPartido(partido, idLocal, idVisitante);
        }


        private static void GetAllMunicipios()
        {
            Console.WriteLine("Equipos Eencontrados\n");

            foreach (var municipio in _repoMunicipio.GetAllMunicipios())

            {
                Console.WriteLine(municipio.Id + " " + municipio.Nombre);
            }
        }



        private static void GetAllDTs()
        {
            foreach (var dt in _repoDT.GetAllDTs())
            {
                Console.WriteLine(dt.Id + "/" + "Nombre: " + dt.Nombre + "/Doc: " +
                 dt.Documento + "/Tel: " + dt.Telefono);
            }
        }

        private static void GetAllEquipos()
        {
            foreach (var equipo in _repoEquipo.GetAllEquipos())
            {
                Console.WriteLine(equipo.Id + "/NombreEquipo: " + equipo.Nombre + "/Municipio: " +
                 equipo.Municipio.Nombre + "/DT: " + equipo.DirectorTecnico.Nombre);
            }
        }

        private static void GetAllPociciones()
        {
            foreach (var posicion in _repoPosicion.GetAllPosiciones())
            {
                Console.WriteLine(posicion.Id + "/NomrePosición: " + posicion.Nombre);
            }
        }

        private static void GetAllJugadores()
        {
            foreach (var jugador in _repoJugador.GetAllJugadores())
            {
                Console.WriteLine(jugador.Id + "/Nombre: " + jugador.Nombre + "/Número: " + jugador.Numero + "/NombreEquipo: " + jugador.Equipo.Nombre + " / NombrePosición: " + jugador.Posicion.Nombre);
            }
        }

        private static void GetAllPartidos()
        {
            foreach (var partido in _repoPartido.GetAllPartidos())
            {
                Console.WriteLine(partido.Id + "/Fecha: " + partido.FechaHora.ToString() + "/EquipoLocal: " +
                partido.Local.Nombre + "/MarcadorLocal: " + partido.MarcadorLocal + "/EquipoVisitante: " + partido.
                Visitante.Nombre + "/MarcadorVisitante: " + partido.MarcadorVisitante);
            }
        }


    }
}

