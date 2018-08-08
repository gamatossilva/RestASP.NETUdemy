﻿using RestASPNETUdemy.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestASPNETUdemy.Repository
{
    public interface IUserRepository
    {
        User FindByLogin(string login);
    }
}
