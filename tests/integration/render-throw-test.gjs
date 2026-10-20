import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-render-throw-repro/tests/helpers';
import { render, settled, setupOnerror } from '@ember/test-helpers';
import { tracked } from '@glimmer/tracking';

const boom = () => {
  throw new Error('boom');
};

class State {
  @tracked count = 0;
}

module('Integration | a render that throws', function (hooks) {
  setupRenderingTest(hooks);

  test('a helper throws during render', async function (assert) {
    setupOnerror((error) => assert.strictEqual(error.message, 'boom'));

    await render(<template>{{boom}}</template>);
  });

  test('a later, unrelated test', async function (assert) {
    const state = new State();

    state.count++;

    await settled();

    assert.ok(true);
  });
});
