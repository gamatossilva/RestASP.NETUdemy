using Microsoft.AspNetCore.Mvc;
using RestASPNETUdemy.Model;
using RestASPNETUdemy.Business;
using RestASPNETUdemy.Data.VO;
using Tapioca.HATEOAS;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;

namespace RestASPNETUdemy.Controllers {
    [ApiVersion("1")]
    [Route("api/[controller]/v{version:apiVersion}")]
    public class PersonsController : Controller
    {

        private IPersonBusiness _personBusiness;

        public PersonsController(IPersonBusiness personBusiness) {
            _personBusiness = personBusiness;
        }

        // GET api/values
        [HttpGet]
        [Authorize("Bearer")]
        [TypeFilter(typeof(HyperMediaFilter))]
        public IActionResult Get()
        {
            return new OkObjectResult(_personBusiness.FindAll());
        }

        [HttpGet("find-by-name")]
        [Authorize("Bearer")]
        [TypeFilter(typeof(HyperMediaFilter))]
        public IActionResult GetByName([FromQuery] string firstName, [FromQuery] string lastName) {
            return new OkObjectResult(_personBusiness.FindByName(firstName, lastName));
        }


        [HttpGet("find-with-paged-search/{sortDirection}/{pageSize}/{page}")]
        [Authorize("Bearer")]
        [TypeFilter(typeof(HyperMediaFilter))]
        public IActionResult GetPagedSearch([FromQuery] string name, string sortDirection, int pageSize, int page) {
            return new OkObjectResult(_personBusiness.FindWithPagedSearch(name, sortDirection, pageSize, page));
        }


        // GET api/values/5
        [HttpGet("{id}")]
        [Authorize("Bearer")]
        [TypeFilter(typeof(HyperMediaFilter))]
        public IActionResult Get(long id)
        {
            var person = _personBusiness.FindById(id);
            if(person == null) {
                return NotFound();
            }
            return new OkObjectResult(person);
        }

        // POST api/values
        [HttpPost]
        [Authorize("Bearer")]
        [TypeFilter(typeof(HyperMediaFilter))]
        public IActionResult Post([FromBody]PersonVO person)
        {
            if(person == null) {
                return BadRequest();
            }
            return new OkObjectResult(_personBusiness.Create(person));
        }

        // PUT api/values/5
        [HttpPut]
        [Authorize("Bearer")]
        [TypeFilter(typeof(HyperMediaFilter))]
        public IActionResult Put([FromBody]PersonVO person)
        {
            if (person == null) {
                return BadRequest();
            }
            var updatedPerson = _personBusiness.Update(person);
            if(updatedPerson == null) {
                return BadRequest();
            }
            return new OkObjectResult(_personBusiness.Update(person));
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        [Authorize("Bearer")]
        [TypeFilter(typeof(HyperMediaFilter))]
        public IActionResult Delete(int id)
        {
            _personBusiness.Delete(id);
            return NoContent();
        }
    }
}
