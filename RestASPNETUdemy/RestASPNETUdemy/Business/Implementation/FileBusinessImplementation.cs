using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using RestASPNETUdemy.Data.VO;

namespace RestASPNETUdemy.Business.Implementation
{
    public class FileBusinessImplementation : IFileBusiness {
        public byte[] GetPDFFile() {
            string path = Directory.GetCurrentDirectory();
            var fullPath = path + "\\Other";
            return File.ReadAllBytes(fullPath);
        }
    }
}
