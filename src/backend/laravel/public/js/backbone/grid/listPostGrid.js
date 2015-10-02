// Create post grid
postGrid = Backbone.zecGrid.extend({
    options : {
        addUrl : false,
        filter : false,
        alphabet : false,
        indexField : 'id',
        className : 'table table-striped table-hover',
        columns : [
            {field : "id", name : "ID", width: 50},
            {field : "title", selectedField : true,name : "Title"},
            {field : "status_name", sortField: "status", name: "Status",width: 90},
            {field : "id", name : "Action", width : '100px', xtype : 'template',unsortable : true,
             tpl : _.template($('#actionButtonTpl').html()) }
        ],
        tbar : {
            buttons : {
                id : "btnToolbar",
                className : "btn-toolbar pull-right",
                data : [{
                    id:"btnCreate",
                    name:'Create',
                    className : "btn btn-success",
                    iconCls : "glyphicon glyphicon-plus"
                }]
            }
        }
    },
    initialize : function() {
        Backbone.zecGrid.prototype.initialize.call(this,this.options);
    },
    events : _.extend({
        'click button#btnDelpost' : 'delposts',
        'click .detailBtn' : 'viewDetail',
        'click .updRow ' : 'updpost',
        'click .removeRow':'delpost',
        'click #btnCreate' : 'create'
    } , Backbone.zecGrid.prototype.events),

    selectedRow : function(e) {
        $row = $(e.currentTarget).closest('tr');
        window.location.href = urlBase+'/article/'+$row.data('id');
    },

    create: function(e) {
        window.location.href = urlBase + '/users/articles/create';
    },

    updpost : function (e) {
        $row = $(e.currentTarget);
        var postId = parseInt($row.data("id"));
        window.location.href = urlBase+'/users/articles/edit/'+postId;
    },

    delpost : function(e) {
        $row = $(e.currentTarget);
        var postId = parseInt($row.data("id"));
        var self = this;
        var delPostModel = this.collection.get(postId);
        delPostModel.url = urlBase + '/posts/' + postId;
        var confirmMsg = confirm("Are you sure want to delete this post ?");
        if (confirmMsg) {
            delPostModel.destroy({
                data : { _token : token },
                processData: true,
                success: function(model, response) {
                    if (200 == response.meta.code) {
                        alert(response.meta.messages[0].message);
                        self.collection.fetch({reset:true});
                    } else {
                        alert(response.meta.messages[0].message);
                    }
                }
            });
        }
    },

});


var AppRouter = Backbone.Router.extend({
    routes : {
        "" : "list",
    },
    // Step 1.3 : Set up initialization
    initialize : function() {
        this.postCollection = new postCollection();
        this.postCollection.url = urlBase+'/posts/collection';
        this.postGrid = new postGrid({
            el: $('#postGrid'),
            collection: this.postCollection
        });
    },

    list: function() {
        this.postCollection.fetch({reset: true});
    }
});

var app = new AppRouter();
Backbone.history.start();
