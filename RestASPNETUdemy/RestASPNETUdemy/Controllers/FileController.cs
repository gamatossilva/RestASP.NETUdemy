using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RestASPNETUdemy.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestASPNETUdemy.Controllers
{
    [ApiVersion("1")]
    [Route("api/[controller]/v{version:apiVersion}")]
    public class FileController : Controller
    {
        private IFileBusiness _fileBusiness;

        public FileController(IFileBusiness fileBusiness) {
            _fileBusiness = fileBusiness;
        }

        [HttpGet]
        [Authorize("Bearer")]
        public IActionResult GetPDFFile() {
            byte[] buffer = _fileBusiness.GetPDFFile();
            if(buffer != null) {
                HttpContext.Response.ContentType = "application/pdf";
                HttpContext.Response.Headers.Add("content-length", buffer.Length.ToString());
                HttpContext.Response.Body.Write(buffer, 0, buffer.Length);
            }
            return new ContentResult();
        }
    }
}
