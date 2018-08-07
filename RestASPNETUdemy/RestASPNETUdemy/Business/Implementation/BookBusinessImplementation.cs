using RestASPNETUdemy.Model;
using RestASPNETUdemy.Repository.Generic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestASPNETUdemy.Business.Implementation
{
    public class BookBusinessImplementation : IBookBusiness
    {
        private IRepository<Book> _repository;

        public BookBusinessImplementation(IRepository<Book> repository) {
            _repository = repository;
        }

        public Book Create(Book book) {
            return _repository.Create(book);
        }

        public Book FindById(long id) {
            return _repository.FindById(id);
        }

        public List<Book> FindAll() {
            return _repository.FindAll();
        }

        public Book Update(Book book) {
            return _repository.Update(book);
        }

        public void Delete(long id) {
            _repository.Delete(id);
        }

        public bool Exists(long id) {
            return _repository.Exists(id);
        }
    }
}
