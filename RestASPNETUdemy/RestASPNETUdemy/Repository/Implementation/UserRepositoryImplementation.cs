using RestASPNETUdemy.Model;
using RestASPNETUdemy.Model.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestASPNETUdemy.Repository.Implementation
{
    public class UserRepositoryImplementation : IUserRepository
    {
        private readonly MySQLContext _context;

        public UserRepositoryImplementation(MySQLContext context) {
            _context = context;
        }

        public User FindByLogin(string login) {
            return _context.Users.SingleOrDefault(u => u.Login.Equals(login));
        }


    }
}
