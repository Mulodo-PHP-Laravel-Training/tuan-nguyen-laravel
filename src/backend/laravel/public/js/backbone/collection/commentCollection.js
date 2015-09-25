// Get full account info
var defaults = {
    id : null,
    author_id : null,
    title: null,
    content: null,
}

var commentModel = Backbone.Model.extend({
    urlRoot : urlBase + '/api/comments',
    urlUpdate: urlBase + '/admin/posts/',
    defaults:defaults,
    idAttribute : "id",
    state: {
        pageSize: 5,
        sortKey: "id",
        order: 1,
    },
    queryParams : {
    },

    validation: {
        content: {
            required: true
        }
    }
});

// Load full account info
commentCollection = Backbone.PageableCollection.extend({
    model : commentModel,
    url : urlBase + "/admin/comments/collection",
    // Initial pagination states
    state: {
      pageSize: 10,
      sortKey: "id",
      order: 1,
    },
    defaultState : {
        currentPage : 1,
        per_page : 10,
        sortKey : 'id',
        order : 1,
    },
    queryParams : {
    }
});
