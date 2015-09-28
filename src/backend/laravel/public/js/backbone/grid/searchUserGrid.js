// Create user grid
userGrid = Backbone.zecGrid.extend({
    options : {
        addUrl : false,
        filter : false,
        alphabet : false,
        indexField : 'id',
        className : 'table table-striped table-hover',
        columns : [
            {field : "", name :"" ,width : '32px', xtype : 'checkbox'},
            {field : "id", name : "ID", width: 50},
            {field : "username", selectedField : true,name : "Username"},
            {field : "first_name",name : "First name"},
            {field : "last_name",name : "Last name"},
            {field : "email", width: 180, name : "Email"},
            {field : "role_name", sortField: 'is_admin', name : "Role"},
            {field : "id", name : "Action", width : '150px', xtype : 'template',unsortable : true,
             tpl : _.template($('#PostsTpl').html()) }

        ],
    },
    initialize : function() {
        Backbone.zecGrid.prototype.initialize.call(this,this.options);
    },
    events : _.extend({
        'click .updRow ' : 'updUser',
    } , Backbone.zecGrid.prototype.events),

    updUser : function (e) {
        $row = $(e.currentTarget);
        var userId = parseInt($row.data("id"));
        app.userForm.model = app.userCollection.get(userId);
        app.userForm.render();
    },
});

var AppRouter = Backbone.Router.extend({
    routes : {
        "" : "list",
    },
    // Step 1.3 : Set up initialization
    initialize : function() {
        this.userCollection = new userCollection();
        this.userModel = new userModel();
        this.userGrid = new userGrid({
            el: $('#userGrid'),
            collection: this.userCollection
        });
    },

    list: function() {
        if ('' != q) {
            this.userCollection.queryParams.q = q.trim();
        }
        this.userCollection.fetch({reset: true});
    }
});

var app = new AppRouter();
Backbone.history.start();
