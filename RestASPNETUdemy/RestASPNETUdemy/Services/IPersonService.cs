using RestASPNETUdemy.Model;
using System.Collections.Generic;

namespace RestASPNETUdemy.Services {
    public interface IPersonService
    {
        Person Create(Person person);
        Person FindById(long id);
        List<Person> FindAll();
        Person Update(Person person);
        void Delete(long id);
    }
}
