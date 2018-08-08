using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using RestASPNETUdemy.Model;
using RestASPNETUdemy.Model.Context;
using RestASPNETUdemy.Repository;
using RestASPNETUdemy.Repository.Generic;

namespace RestASPNETUdemy.Business.Implementation {
    public class PersonRepositoryImplementation : GenericRepository<Person>, IPersonRepository {


        public PersonRepositoryImplementation(MySQLContext context) : base(context){}

        public List<Person> FindByName(string firstName, string lastName) {

            if(!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName)) {

                return _context.Persons.Where(p => p.FirstName.Contains(firstName) && p.LastName.Contains(lastName)).ToList();

            } else if (string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName)) {

                return _context.Persons.Where(p => p.LastName.Contains(lastName)).ToList();

            } else if (!string.IsNullOrEmpty(firstName) && string.IsNullOrEmpty(lastName)) {

                return _context.Persons.Where(p => p.FirstName.Contains(firstName)).ToList();

            } else {

                return _context.Persons.ToList();

            }
        }
    }
}
