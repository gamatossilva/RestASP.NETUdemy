using RestASPNETUdemy.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestASPNETUdemy.Business
{
    public interface ILoginBusiness
    {
        object FindByLogin(User user);
    }
}
