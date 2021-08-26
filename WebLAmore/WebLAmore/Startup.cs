using FluentValidation;
using ManejoExtintores.Infraestructura.Validaciones;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Text;
using WebLAmore.core.Interfaces;
using WebLAmore.Core.DTO.Request;
using WebLAmore.Core.Interfaces;
using WebLAmore.Core.Modelos;
using WebLAmore.Infraestructura.Data;
using WebLAmore.Infraestructura.Middleware;
using WebLAmore.Infraestructura.Repositorios;
using WebLAmore.Infraestructura.ServicioEmail;
using WebLAmore.Infraestructura.Validaciones;
using WebLAmore.JwtGenerador;

namespace WebLAmore
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<WebLAmoreContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

            services.AddIdentity<Usuario, IdentityRole>(opt =>
            {
                opt.Password.RequiredLength = 7;
                opt.Password.RequireDigit = false;

                opt.User.RequireUniqueEmail = true;

                opt.Lockout.AllowedForNewUsers = true;
                opt.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(2);
                opt.Lockout.MaxFailedAccessAttempts = 3;
            })
            .AddEntityFrameworkStores<WebLAmoreContext>()
            .AddDefaultTokenProviders();

            services.Configure<DataProtectionTokenProviderOptions>(opt =>
                opt.TokenLifespan = TimeSpan.FromHours(2));

            var jwtConfiguracion = Configuration.GetSection("JWTConfiguracion");
            services.AddAuthentication(opt =>
            {
                opt.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                opt.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,

                    ValidIssuer = jwtConfiguracion.GetSection("validIssuer").Value,
                    ValidAudience = jwtConfiguracion.GetSection("validAudience").Value,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtConfiguracion.GetSection("securityKey").Value))
                };
            });

            services.AddScoped<JwtHandler>();

            var emailConfig = Configuration
                .GetSection("ConfiguracionEmail")
                .Get<ConfiguracionEmail>();
            services.AddSingleton(emailConfig);
            services.AddScoped<IEmailSender, EmailSender>();

            services.AddControllers();

            services.AddScoped(typeof(IRepositorioBase<Cliente>), typeof(RepositorioBase<Cliente>));
            services.AddTransient<IRepositorioClientes, RepositorioClientes>();
            services.AddScoped(typeof(IRepositorioBase<DetallePedido>), typeof(RepositorioBase<DetallePedido>));
            services.AddTransient<IRepositorioDetallePedido, RepositorioDetallePedido>();
            services.AddScoped(typeof(IRepositorioBase<Pedido>), typeof(RepositorioBase<Pedido>));
            services.AddTransient<IRepositorioPedido, RepositorioPedido>();
            services.AddScoped(typeof(IRepositorioBase<Producto>), typeof(RepositorioBase<Producto>));
            services.AddTransient<IRepositorioProductos, RepositorioProductos>();
            services.AddScoped(typeof(IRepositorioBase<Usuario>), typeof(RepositorioBase<Usuario>));

            services.AddTransient<IValidator<ClienteBase>, ValidacionCliente>();
            services.AddTransient<IValidator<DetallePedidoBase>, ValidacionDetalle>();
            services.AddTransient<IValidator<PedidoBase>, ValidacionPedido>(); 
            services.AddTransient<IValidator<ProductoBase>, ValidacionProducto>(); 
            services.AddTransient<IValidator<VerificacionEnDosPasosDto>, ValidacionVerificacionDosPasos>(); 
            services.AddTransient<IValidator<AutenticacionUsuarioDto>, ValidacionAutenticacionUsuario>(); 

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "WebLAmore", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = "Bearer",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });
                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                       new OpenApiSecurityScheme
                       {
                          Reference = new OpenApiReference
                          {
                             Type = ReferenceType.SecurityScheme,
                             Id = "Bearer"
                          },
                          Scheme = "oauth2",
                          Name = "Bearer",
                          In = ParameterLocation.Header,
                       },
                       new List<string>()
                    }
                });
            
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseMiddleware<Middleware>();
            if (env.IsDevelopment())
            {
                //app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "WebLAmore v1"));
            }

            app.UseHttpsRedirection();

            app.UseCors(builder => {
                builder.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod();
            });

            app.UseAuthentication();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
