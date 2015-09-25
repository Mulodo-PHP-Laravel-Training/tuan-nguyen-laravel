var AppRouter = Backbone.Router.extend({
    routes : {
        "" : "list",
    },
    // Step 1.3 : Set up initialization
    initialize : function() {
        this.postCollection = new postCollection();
        this.postGrid = new postGrid({
            el: $('#postGrid'),
            collection: this.postCollection
        });

        this.postModel = new postModel();
        this.postForm = new postForm({
            el: $('#postForm'),
            model: this.postModel
        }).render();
    },

    list: function() {
        this.postCollection.fetch({reset: true});
    }
});

var app = new AppRouter();
Backbone.history.start();
