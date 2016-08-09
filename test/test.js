/* global atom */

var test = require('tape');

test('atom', function (t) {
  t.plan(3);
  t.ok('loadTime' in atom, 'should have a `loadTime` prop');
  t.equal(typeof atom.loadTime, 'number', '`loadTime` should be a number');
  t.ok(atom.loadTime < 10000, '`loadTime` should be less than ten seconds');
});
