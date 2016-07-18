var chai = require('chai');
var chaiHttp = require('chai-http');
var chaiJq = require('chai-jq');
var server = require('../index');
var expect = require('chai').expect;
var request = require('supertest');
var should = chai.should();
var cheerio = require('cheerio')

chai.use(chaiHttp);
chai.use(chaiJq);


describe('Questions', function() {
  it('should show Question addition form on /problem/new GET', function(done) {
    request(server)
      .get('/problem/new')
      .end(function(err, res){
        var $ = cheerio.load(res.text)
        expect(res).to.have.status(200);
        expect($('input[name="subject"]').length).to.eql(1);
        expect($('textarea[name="problem"]').length).to.eql(1);
        expect($('input[name="name"]').length).to.eql(1);
        expect($('input[name="email"]').length).to.eql(1);
        expect($('button[type="submit"]').length).to.eql(1)
        done();
      });
  });
  
  it('should add a single problem on /problem POST', function(done) {
    request(server)
      .post('/problem')
      .send({
        'subject': 'What is Scrum?',
        'problem': 'I would like to ask what is Scrum.',
        'name': 'John Doe',
        'email': 'john.doe@example.com'
      })
      .end(function(err, res){
        expect('Location', '/problem/confirm');
        expect(302, done);
        done();
      });
  });
});
