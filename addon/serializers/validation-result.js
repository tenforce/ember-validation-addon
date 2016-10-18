import DS from 'ember-data';

export default DS.JSONAPISerializer.extend({
  normalizeQueryResponse(store, clazz, payload) {
      const result = this._super(...arguments);
      result.meta = result.meta || {};
      if (payload.links) {
          result.meta.pagination = payload.links;
      }
      return result;
  }
});
