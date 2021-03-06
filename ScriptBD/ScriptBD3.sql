USE [master]
GO
/****** Object:  Database [WebLAmore]    Script Date: 3/09/2021 3:44:01 p. m. ******/
CREATE DATABASE [WebLAmore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebLAmore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebLAmore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebLAmore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebLAmore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebLAmore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebLAmore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebLAmore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebLAmore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebLAmore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebLAmore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebLAmore] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebLAmore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebLAmore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebLAmore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebLAmore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebLAmore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebLAmore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebLAmore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebLAmore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebLAmore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebLAmore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebLAmore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebLAmore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebLAmore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebLAmore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebLAmore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebLAmore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebLAmore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebLAmore] SET RECOVERY FULL 
GO
ALTER DATABASE [WebLAmore] SET  MULTI_USER 
GO
ALTER DATABASE [WebLAmore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebLAmore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebLAmore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebLAmore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebLAmore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebLAmore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebLAmore] SET QUERY_STORE = OFF
GO
USE [WebLAmore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/09/2021 3:44:02 p. m. ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Nombres] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Discriminador] [nvarchar](100) NULL,
	[Google] [nvarchar](100) NULL,
	[JoinDate] [datetime2](7) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdClientes] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](max) NULL,
	[Apellidos] [nvarchar](max) NULL,
	[Direccion] [nvarchar](max) NULL,
	[Telefono] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Documento] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallePedidos]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePedidos](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[PedidosId] [int] NULL,
	[ProductosId] [int] NULL,
	[Cantidad] [int] NULL,
	[Valor] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DetallePedidos] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NULL,
	[Fecha] [datetime2](7) NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 3/09/2021 3:44:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [nvarchar](max) NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210607003917_inicial', N'5.0.6')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'98D66CB1-7B23-4AB6-B8D9-7C93059B0307', N'ADMIN', N'ADMIN', N'2021-06-16')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1136e26b-18d0-41bf-ab7b-1fb1202c97ac', N'98D66CB1-7B23-4AB6-B8D9-7C93059B0307')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd8613548-ba32-4624-bfbd-0a1df8056df6', N'98D66CB1-7B23-4AB6-B8D9-7C93059B0307')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f553f280-049f-4c4e-b776-3c3324bc72d1', N'98D66CB1-7B23-4AB6-B8D9-7C93059B0307')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Nombres], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminador], [Google], [JoinDate]) VALUES (N'1136e26b-18d0-41bf-ab7b-1fb1202c97ac', N'juan', N'juan1', N'JUAN1', N'juan@gmail.com', N'JUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECVz6HOWPEr0CdH3hztVp5+qf5m/K+yADDiDXkZoF2+/t3FGj0CDpeoZaKs/gtZorw==', N'JUBITIVFYL6VPX5S4WRCPOTXBIITJBC6', N'dbd3a30b-c2b7-4979-bebd-6e30581a67b0', NULL, 0, 0, NULL, 1, 0, N'Usuario', NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Nombres], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminador], [Google], [JoinDate]) VALUES (N'd8613548-ba32-4624-bfbd-0a1df8056df6', N'Juan', N'juanes', N'JUANES', N'juanes.x777@gmail.com', N'JUANES.X777@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBzsOS4HOI19Q8zd3BgrzU8qU9sgTs37HSbJg5WfVYqRN1ljJsHBQteKrnXeYB5lrA==', N'2ZPPR5YVTZ2Y5QSSFEYBBTRXEQUMS3VX', N'0d62b43d-67b7-43a1-8cfe-f31d602cc1dc', NULL, 0, 0, NULL, 1, 0, N'Usuario', NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Nombres], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminador], [Google], [JoinDate]) VALUES (N'f553f280-049f-4c4e-b776-3c3324bc72d1', N'Ana Martinez', N'ana', N'ANA', N'ana@gmail.com', N'ANA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBbWMnMppdIgu0BYPw5N64Rl7lO9JnoyplEHYTM+QLL4a4gEr4CPpnKkCNAFQoQ2tw==', N'GSFXIWOKMHPREGC5JZPTDU6RQESMBX7K', N'a433ee29-c787-4662-b60c-ca032dd168e3', NULL, 0, 0, NULL, 1, 0, N'Usuario', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([IdClientes], [Nombres], [Apellidos], [Direccion], [Telefono], [Email], [Documento]) VALUES (1, N'Ovelis', N'Saldarriaga', N'El encanto', N'3509874531', N'OveS@hotmail.com', CAST(70987054 AS Decimal(18, 0)))
INSERT [dbo].[Clientes] ([IdClientes], [Nombres], [Apellidos], [Direccion], [Telefono], [Email], [Documento]) VALUES (3, N'Rafael', N'Correa', N'La maría', N'3215678905', N'RC@gmail.com', CAST(70567890 AS Decimal(18, 0)))
INSERT [dbo].[Clientes] ([IdClientes], [Nombres], [Apellidos], [Direccion], [Telefono], [Email], [Documento]) VALUES (4, N'Lina', N'Ruiz', N'Cl 23 #21-30', N'3214567800', N'LR@hotmail.com', CAST(1018345678 AS Decimal(18, 0)))
INSERT [dbo].[Clientes] ([IdClientes], [Nombres], [Apellidos], [Direccion], [Telefono], [Email], [Documento]) VALUES (1002, N'Santiago', N'Ruiz Gómez', N'Cl 23 #23-67', N'3003456789', N'string', CAST(1018900564 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallePedidos] ON 

INSERT [dbo].[DetallePedidos] ([IdDetalle], [PedidosId], [ProductosId], [Cantidad], [Valor]) VALUES (3, 9, 1, 1, CAST(67000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DetallePedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([IdPedido], [ClienteId], [Fecha], [Estado]) VALUES (9, 1, CAST(N'2021-07-30T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([IdProducto], [NombreProducto], [Cantidad], [Precio]) VALUES (1, N'Zanahoria', 100, CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Productos] ([IdProducto], [NombreProducto], [Cantidad], [Precio]) VALUES (2, N'Tomate', 150, CAST(2800 AS Decimal(18, 0)))
INSERT [dbo].[Productos] ([IdProducto], [NombreProducto], [Cantidad], [Precio]) VALUES (5, N'Arroz', 1000, CAST(3500 AS Decimal(18, 0)))
INSERT [dbo].[Productos] ([IdProducto], [NombreProducto], [Cantidad], [Precio]) VALUES (6, N'Tv', 100, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[Productos] ([IdProducto], [NombreProducto], [Cantidad], [Precio]) VALUES (7, N'Monitor', 10, CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[Productos] ([IdProducto], [NombreProducto], [Cantidad], [Precio]) VALUES (8, N'Lavadora', 5, CAST(1300000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DetallePedidos_PedidosId]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_DetallePedidos_PedidosId] ON [dbo].[DetallePedidos]
(
	[PedidosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DetallePedidos_ProductosId]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_DetallePedidos_ProductosId] ON [dbo].[DetallePedidos]
(
	[ProductosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pedidos_ClienteId]    Script Date: 3/09/2021 3:44:02 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Pedidos_ClienteId] ON [dbo].[Pedidos]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[DetallePedidos]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedidos_Pedidos_PedidosId] FOREIGN KEY([PedidosId])
REFERENCES [dbo].[Pedidos] ([IdPedido])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetallePedidos] CHECK CONSTRAINT [FK_DetallePedidos_Pedidos_PedidosId]
GO
ALTER TABLE [dbo].[DetallePedidos]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedidos_Productos_ProductosId] FOREIGN KEY([ProductosId])
REFERENCES [dbo].[Productos] ([IdProducto])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DetallePedidos] CHECK CONSTRAINT [FK_DetallePedidos_Productos_ProductosId]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([IdClientes])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes_ClienteId]
GO
USE [master]
GO
ALTER DATABASE [WebLAmore] SET  READ_WRITE 
GO
