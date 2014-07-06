require('../test-helper');
var ItemTemplate = require('../../lib/item-template');

describe('ItemTemplate', function () {
  it('generates a new template', function () {
    var Foo = new ItemTemplate({name: 'Foo'});
    assert.equal('Foo', Foo.template.name);
  });

  describe('field type behaviors', function () {
    it('field can be required');
    it('field can be validated');
    it('field can have default value');
    it('boolean field can be set to true');
    it('boolean field can be set to false');
    it('string field can be set to single line');
    it('string field can be set to multiple lines');
    it('string field can be a pattern');
    it('number field can be whole');
    it('number field can be decimal');
    it('number field can be trimmed to n decimal points');
    it('number field can be currency');
    it('timestamp field can use custom pattern');
    it('timestamp field can have a timezone');
  });

  describe('generated template defaults', function () {
    it('has a custom id string field as pattern');
    it('has an amount number field as currency');
    it('has a recurring boolean field');
    it('has a name string field');
    it('has a description string field as multi-line');
    it('has a created at timestamp field');
    it('has an updated at timestamp field');
  });

  describe('Creates a MembershipTemplate', function () {
    it('is recurring');
    it('has a start date timestamp field');
    it('has an end date timestamp field');
  });

  describe('Creates an HammerTemplate', function () {
    it('is not recurring');
    it('has a quantity number field');
    it('has a handle string field');
    it('has a head string field');
    it('has a industrial hardened boolean field');
  });
});
