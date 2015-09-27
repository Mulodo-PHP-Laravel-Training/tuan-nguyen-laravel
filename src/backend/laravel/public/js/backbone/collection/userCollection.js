// Get full account info
var defaults = {
    id : null,
    username : null,
    email : null,
    first_name: null,
    last_name: null,
    password: null,
    password_confirmation:null,
    is_admin : 0
}

var userModel = Backbone.Model.extend({
    urlRoot : urlBase+"/admin/users",
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
        username: {
            required: true
        },
        first_name: {
            required: true
        },
        last_name: {
            required: true
        },
        email: {
            required: true,
            pattern: 'email'
        },
        password: {
            required: true,
            minLength: 6,
            maxLength:20
        },
        password_confirmation: {
            required: true,
            equalTo: 'password',
            msg: 'The passwords does not match'
        },
    }
});

// Load full account info
userCollection = Backbone.PageableCollection.extend({
    model : userModel,
    url : urlBase + "/admin/users/collection",
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
