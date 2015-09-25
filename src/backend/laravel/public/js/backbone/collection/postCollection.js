// Get full account info
var defaults = {
    id : null,
    author_id : null,
    title: null,
    content: null,
    status: 1
}

var postModel = Backbone.Model.extend({
    urlRoot : urlBase + '/api/posts',
    urlInsert : urlBase + '/api/posts',
    urlUpdate: urlBase + '/api/posts',
    urlDelete: urlBase + '/admin/posts',
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
        title: {
            required: true
        },
        content: {
            required: true
        }
    }
});

// Load full account info
postCollection = Backbone.PageableCollection.extend({
    model : postModel,
    url : urlBase + "/admin/posts/collection",
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
