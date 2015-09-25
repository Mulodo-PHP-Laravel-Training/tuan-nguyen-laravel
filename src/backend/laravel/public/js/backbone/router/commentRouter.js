var AppRouter = Backbone.Router.extend({
    routes : {
        "" : "list",
    },
    // Step 1.3 : Set up initialization
    initialize : function() {
        this.commentCollection = new commentCollection();
        this.commentGrid = new commentGrid({
            el: $('#commentGrid'),
            collection: this.commentCollection
        });

        this.commentModel = new commentModel();
        this.commentForm = new commentForm({
            el: $('#commentForm'),
            model: this.commentModel
        }).render();
    },

    list: function() {
        this.commentCollection.fetch({reset: true});
    }
});

var app = new AppRouter();
Backbone.history.start();
