// Create comment grid
commentGrid = Backbone.zecGrid.extend({
    options : {
        addUrl : false,
        filter : false,
        alphabet : false,
        indexField : 'id',
        className : 'table table-striped table-hover',
        columns : [
            {field : "id", name : "ID", width: 50},
            {field : "content",name : "Comments", unsortable:true, xtype: 'template', tpl: _.template($('#commentTpl').html())},
            {field : "id", name : "Action", width : '100px', xtype : 'template',unsortable : true,
             tpl : _.template($('#actionButtonTpl').html()) }
        ],
    },
    initialize : function() {
        Backbone.zecGrid.prototype.initialize.call(this,this.options);
    },
    events : _.extend({
        'click button#btnDelcomment' : 'delcomments',
        'click .detailBtn' : 'viewDetail',
        'click .updRow ' : 'updComment',
        'click .removeRow':'delComment',
    } , Backbone.zecGrid.prototype.events),

    updComment : function (e) {
        $row = $(e.currentTarget);
        var commentId = parseInt($row.data("id"));
        app.commentForm.model = app.commentCollection.get(commentId);
        app.commentForm.render();
    },
    delComment : function(e) {
        $row = $(e.currentTarget);
        var commentId = parseInt($row.data("id"));
        var self = this;
        var delcommentModel = this.collection.get(commentId);
        delcommentModel.url = urlBase + '/admin/comments/' + commentId;

        var confirmMsg = confirm("Are you sure want to delete this comment!");
        if (confirmMsg) {
            delcommentModel.destroy({
                data : { _token : token },
                processData: true,
                success: function(model, response) {
                    if (200 == response.meta.code) {
                        alert(response.meta.messages[0].message);
                        self.collection.fetch({reset:true});
                    }
                }
            });
        }
    },

});


commentForm = Backbone.View.extend({
    template : _.template($('#frmCommentsTpl').html()),
    initialize : function() {
        //this.model.bind("change", this.render, this);
    },
    events : {
        'click #commentBtn' : 'updComment',
        'click #resetBtn' : 'resetForm',
        "keyup input": "saveOnEnter",
    },
    editor: null,
    render : function() {
        // Render select
        $(this.el).html(this.template(this.model.toJSON()));
        return this;
    },

    // submit form when press enter
    saveOnEnter: function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $(e.currentTarget).blur();
            $('#commentBtn').trigger('click');
        }
    },

    updComment: function(e) {
        Backbone.Validation.bind(this);
        var $btn = $(e.currentTarget);
        var self =this;
        var id = $('#idInput').val();
        var isNew = (id != "") ? false : true;

        $('#errMessages').html('');
        var data = {
            content: $('textarea[name=content]', this.$el).val(),
            status: $('input[name=status]:checked', this.$el).val(),
            _token: token
        };

        if (isNew) {
            alert('Please select a comment to edit');
        } else {
            //this.model.urlRoot = urlBase + '/admin/posts/' + this.model.get('post_id') + '/comments/' + this.model.get('id');
            this.model.set(data);
            // Check if the model is valid before saving
            if(this.model.isValid(true)){
                this.processUpdatecomment(data, $btn);
            }
        }
    },

    processUpdatecomment: function(data, $btn) {
        var self = this;
        $btn.button('loading');
        $.ajax({
            url : urlBase + '/admin/posts/' + this.model.get('post_id') + '/comments/' + this.model.get('id'),
            type: 'PUT',
            data: data,
            success: function(result) {
                if (200 == result.meta.code) {
                    app.commentCollection.fetch({reset : true});
                    self.model.set(self.model.defaults);
                    self.render();
                    $message = $('<span class="text-success"></span>');
                    $message.html(result.meta.messages[0].message);
                    $('#errMessages').append($message);

                } else {
                    $('#errMessages').addClass('has-error');
                    _.each(result.meta.messages, function (message) {
                        $message = $('<span class="help-block"></span>');
                        $message.html(message.message);
                        $('#errMessages').append($message);
                    });
                }
                $btn.button('reset');
            }
        });
    },

    resetForm: function() {
        this.model.set(this.model.defaults);
        this.render();
    }
});