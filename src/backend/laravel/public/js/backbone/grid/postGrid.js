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
            {field : "statusName", name: "Status",width: 90},
            {field : "id", name : "Action", width : '100px', xtype : 'template',unsortable : true,
             tpl : _.template($('#actionButtonTpl').html()) }
        ],
    },
    initialize : function() {
        Backbone.zecGrid.prototype.initialize.call(this,this.options);
    },
    events : _.extend({
        'click button#btnDelpost' : 'delposts',
        'click .detailBtn' : 'viewDetail',
        'click .updRow ' : 'updpost',
        'click .removeRow':'delpost',
    } , Backbone.zecGrid.prototype.events),

    updpost : function (e) {
        $row = $(e.currentTarget);
        var postId = parseInt($row.data("id"));
        app.postForm.model = app.postCollection.get(postId);
        app.postForm.render();
    },
    delpost : function(e) {
        $row = $(e.currentTarget);
        var postId = parseInt($row.data("id"));
        var self = this;
        var delPostModel = this.collection.get(postId);
        delPostModel.url = delPostModel.urlDelete + '/' + postId;
        var ok = confirm("Are you sure want to delete this post!");
        if (ok) {
            delPostModel.destroy({
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


postForm = Backbone.View.extend({
    template : _.template($('#frmPostsTpl').html()),
    initialize : function() {
        //this.model.bind("change", this.render, this);
    },
    events : {
        'click #postBtn' : 'createPost',
        'click #resetBtn' : 'resetForm',
        "keyup input": "createOnEnter",
    },
    editor: null,
    render : function() {
        // Render grid
        $(this.el).html(this.template(this.model.toJSON()));
        this.editor = new TINY.editor.edit('editor',{
            id:'content',
            width:600,
            height:175,
            cssclass:'te',
            controlclass:'tecontrol',
            rowclass:'teheader',
            dividerclass:'tedivider',
            controls:['bold','italic','underline','strikethrough','|','subscript','superscript','|',
                      'orderedlist','unorderedlist','|','outdent','indent','|','leftalign',
                      'centeralign','rightalign','blockjustify','|','unformat','|','undo','redo','n',
                      'font','size','style','|','image','hr','link','unlink','|','cut','copy','paste','print'],
            footer:true,
            fonts:['Verdana','Arial','Georgia','Trebuchet MS'],
            xhtml:true,
            cssfile:'style.css',
            bodyid:'editor',
            footerclass:'tefooter',
            toggle:{text:'show source',activetext:'show wysiwyg',cssclass:'toggle'},
            resize:{cssclass:'resize'}
        });

        return this;
    },

    // submit form when press enter
    createOnEnter: function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $(e.currentTarget).blur();
            $('#postBtn').trigger('click');
        }
    },

    createPost: function(e) {
        Backbone.Validation.bind(this);
        var $btn = $(e.currentTarget);
        var self =this;
        var id = $('#idInput').val();
        var isNew = (id != "") ? false : true;

        $('#errMessages').html('');
        this.editor.post();
        var data = {
            title: $('input[name=title]', this.$el).val(),
            content: $('textarea[name=content]', this.$el).val(),
            status: $('input[name=status]:checked', this.$el).val(),
            token: userToken
        };

        if (isNew) {
            this.model.urlRoot = this.model.urlInsert;
        } else {
            this.model.urlRoot = this.model.urlUpdate;
        }
        this.model.set(data);
        // Check if the model is valid before saving
        if(this.model.isValid(true)){
            if (isNew) {
                this.processCreatePost(data, $btn);
            } else {
                this.processUpdatePost(data,$btn);
            }
        }
    },

    processCreatePost: function(data, $btn) {
        var self = this;
        this.model.save(data, {
            success: function(model, result) {
                if (200 == result.meta.code) {
                    app.postCollection.fetch({reset : true});
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
            }, error: function() {
                $btn.button('reset');
            }
        });
    },

    processUpdatePost: function(data, $btn) {
        var self = this;
        $btn.button('loading');
        $.ajax({
            url : this.model.urlUpdate + '/' + this.model.get('id'),
            type: 'POST',
            data: data,
            success: function(result) {
                if (200 == result.meta.code) {
                    app.postCollection.fetch({reset : true});
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