USE [TorneoG4]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15/09/2022 11:08:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectoresTecnicos]    Script Date: 15/09/2022 11:08:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectoresTecnicos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Documento] [nvarchar](max) NOT NULL,
	[Telefono] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DirectoresTecnicos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 15/09/2022 11:08:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[MunicipioId] [int] NOT NULL,
	[DirectorTecnicoId] [int] NOT NULL,
 CONSTRAINT [PK_Equipos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 15/09/2022 11:08:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugadores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Numero] [int] NOT NULL,
	[EquipoId] [int] NOT NULL,
	[PosicionId] [int] NOT NULL,
 CONSTRAINT [PK_Jugadores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 15/09/2022 11:08:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partidos]    Script Date: 15/09/2022 11:08:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partidos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime2](7) NOT NULL,
	[LocalId] [int] NOT NULL,
	[MarcadorLocal] [int] NOT NULL,
	[VisitanteId] [int] NOT NULL,
	[MarcadorVisitante] [int] NOT NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posiciones]    Script Date: 15/09/2022 11:08:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posiciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Posiciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220907195036_InitialCreate', N'6.0.8')
GO
SET IDENTITY_INSERT [dbo].[DirectoresTecnicos] ON 

INSERT [dbo].[DirectoresTecnicos] ([Id], [Nombre], [Documento], [Telefono]) VALUES (1, N'Pedro Suarez', N'1235', N'6548')
INSERT [dbo].[DirectoresTecnicos] ([Id], [Nombre], [Documento], [Telefono]) VALUES (2, N'Jose Cuervo', N'7856', N'4516')
SET IDENTITY_INSERT [dbo].[DirectoresTecnicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([Id], [Nombre], [MunicipioId], [DirectorTecnicoId]) VALUES (1, N'Millonarios', 2, 1)
INSERT [dbo].[Equipos] ([Id], [Nombre], [MunicipioId], [DirectorTecnicoId]) VALUES (2, N'Deportivo Cali', 2, 2)
SET IDENTITY_INSERT [dbo].[Equipos] OFF
GO
SET IDENTITY_INSERT [dbo].[Jugadores] ON 

INSERT [dbo].[Jugadores] ([Id], [Nombre], [Numero], [EquipoId], [PosicionId]) VALUES (1, N'Juan Perez', 10, 1, 1)
INSERT [dbo].[Jugadores] ([Id], [Nombre], [Numero], [EquipoId], [PosicionId]) VALUES (2, N'Pedro gonzalez', 11, 2, 2)
SET IDENTITY_INSERT [dbo].[Jugadores] OFF
GO
SET IDENTITY_INSERT [dbo].[Municipios] ON 

INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (1, N'Bogota')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (2, N'Medellin')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (3, N'Cali')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (4, N'Pereira')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (5, N'Cali')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (6, N'Bogota')
SET IDENTITY_INSERT [dbo].[Municipios] OFF
GO
SET IDENTITY_INSERT [dbo].[Partidos] ON 

INSERT [dbo].[Partidos] ([Id], [FechaHora], [LocalId], [MarcadorLocal], [VisitanteId], [MarcadorVisitante]) VALUES (2, CAST(N'2022-09-07T20:41:28.4368513' AS DateTime2), 1, 2, 2, 1)
INSERT [dbo].[Partidos] ([Id], [FechaHora], [LocalId], [MarcadorLocal], [VisitanteId], [MarcadorVisitante]) VALUES (3, CAST(N'2022-09-07T20:44:31.2481052' AS DateTime2), 1, 1, 2, 1)
INSERT [dbo].[Partidos] ([Id], [FechaHora], [LocalId], [MarcadorLocal], [VisitanteId], [MarcadorVisitante]) VALUES (4, CAST(N'2022-09-07T20:47:51.9153772' AS DateTime2), 2, 8, 1, 9)
SET IDENTITY_INSERT [dbo].[Partidos] OFF
GO
SET IDENTITY_INSERT [dbo].[Posiciones] ON 

INSERT [dbo].[Posiciones] ([Id], [Nombre]) VALUES (1, N'Defensa')
INSERT [dbo].[Posiciones] ([Id], [Nombre]) VALUES (2, N'Arquero')
INSERT [dbo].[Posiciones] ([Id], [Nombre]) VALUES (3, N'Delantero')
INSERT [dbo].[Posiciones] ([Id], [Nombre]) VALUES (4, N'Defenza')
SET IDENTITY_INSERT [dbo].[Posiciones] OFF
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [FK_Equipos_DirectoresTecnicos_DirectorTecnicoId] FOREIGN KEY([DirectorTecnicoId])
REFERENCES [dbo].[DirectoresTecnicos] ([Id])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [FK_Equipos_DirectoresTecnicos_DirectorTecnicoId]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [FK_Equipos_Municipios_MunicipioId] FOREIGN KEY([MunicipioId])
REFERENCES [dbo].[Municipios] ([Id])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [FK_Equipos_Municipios_MunicipioId]
GO
ALTER TABLE [dbo].[Jugadores]  WITH CHECK ADD  CONSTRAINT [FK_Jugadores_Equipos_EquipoId] FOREIGN KEY([EquipoId])
REFERENCES [dbo].[Equipos] ([Id])
GO
ALTER TABLE [dbo].[Jugadores] CHECK CONSTRAINT [FK_Jugadores_Equipos_EquipoId]
GO
ALTER TABLE [dbo].[Jugadores]  WITH CHECK ADD  CONSTRAINT [FK_Jugadores_Posiciones_PosicionId] FOREIGN KEY([PosicionId])
REFERENCES [dbo].[Posiciones] ([Id])
GO
ALTER TABLE [dbo].[Jugadores] CHECK CONSTRAINT [FK_Jugadores_Posiciones_PosicionId]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Equipos_LocalId] FOREIGN KEY([LocalId])
REFERENCES [dbo].[Equipos] ([Id])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Equipos_LocalId]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Equipos_VisitanteId] FOREIGN KEY([VisitanteId])
REFERENCES [dbo].[Equipos] ([Id])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Equipos_VisitanteId]
GO
