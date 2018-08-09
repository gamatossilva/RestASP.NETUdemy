using RestASPNETUdemy.Data.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestASPNETUdemy.Business
{
    public interface IFileBusiness
    {
        byte[] GetPDFFile();
    }
}
