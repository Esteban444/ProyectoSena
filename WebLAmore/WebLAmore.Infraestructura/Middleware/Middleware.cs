

using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Threading.Tasks;
using WebLAmore.Core.Excepciones;

namespace WebLAmore.Infraestructura.Middleware
{
    public class Middleware
    {
        private readonly RequestDelegate _requestDelegate;
        private readonly ILogger<Middleware> _logger;
        public Middleware(RequestDelegate next, ILogger<Middleware> logger) 
        {
            _requestDelegate = next;
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _requestDelegate(context);
            }
            catch (Exception e)
            {
                await ManejoExcepcionAsync(context, e, _logger);
            }
        }

        public async Task ManejoExcepcionAsync(HttpContext context, Exception e, ILogger<Middleware> logger)
        {
            object errores = null;
            switch (e)
            {
                case ManejoExcepciones me:
                    logger.LogError(e, "Manejo de errores");
                    errores = me.Error;
                    context.Response.StatusCode = (int)me.Codigo;
                    break;

                case Exception ex:
                    logger.LogError(e, "Error de servidor");
                    errores = string.IsNullOrWhiteSpace(ex.Message) ? "Error" : ex.Message;
                    context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                    break;

            }
            context.Response.ContentType = "application/json";
            if (errores != null)
            {
                var resultados = JsonConvert.SerializeObject(new { errores });
                await context.Response.WriteAsync(resultados);
            }
        }
    }
}
