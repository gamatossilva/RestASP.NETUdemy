using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using RestASPNETUdemy.Model;
using RestASPNETUdemy.Model.Context;
using RestASPNETUdemy.Repository;
using RestASPNETUdemy.Repository.Generic;

namespace RestASPNETUdemy.Business.Implementation {
    public class PersonBusinessImplementation : IPersonBusiness {

        private IRepository<Person> _repository;

        public PersonBusinessImplementation(IRepository<Person> repository) {
            _repository = repository;
        }

        public Person Create(Person person) {
            return _repository.Create(person);
        }

        public void Delete(long id) {
            _repository.Delete(id);
        }

        public List<Person> FindAll() {
            return _repository.FindAll();
        }

        public Person FindById(long id) {
            return _repository.FindById(id);
        }

        public Person Update(Person person) {
            return _repository.Update(person);
        }

    }
}
