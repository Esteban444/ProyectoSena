using System;
using System.Net;

namespace WebLAmore.Core.Excepciones
{
    public class ManejoExcepciones: Exception
    {
        public HttpStatusCode Codigo { get; }
        public object Error { get; }

        public ManejoExcepciones(HttpStatusCode status, object error = null)
        {
            Codigo = status;
            Error = error;
        }
    }
}
