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
        this.userForm = new userForm({
            el: $('#userForm'),
            model: this.userModel
        }).render();
    },

    list: function() {
        this.userCollection.fetch({reset: true});
    }
});

var app = new AppRouter();
Backbone.history.start();
