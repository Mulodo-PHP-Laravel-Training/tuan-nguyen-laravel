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
            {field : "id", name : "Action", width : '100px', xtype : 'template',unsortable : true,
             tpl : _.template($('#actionButtonTpl').html()) }
        ],
    },
    initialize : function() {
        Backbone.zecGrid.prototype.initialize.call(this,this.options);
    },
    events : _.extend({
        'click button#btnAddUser' : 'addUser',
        'click button#btnDelUser' : 'delUsers',
        'click .detailBtn' : 'viewDetail',
        'click .updRow ' : 'updUser',
        'click .removeRow':'delUser',
    } , Backbone.zecGrid.prototype.events),

    selectedRow : function(e) {
        var userId = parseInt($(e.currentTarget).parents("tr").data("id"));
        var redirect = "#view/"+userId;

        redirect += "/page/"+this.collection.state.currentPage;
        var hash = location.hash;
        if (hash == redirect) {
            app.usersModel.trigger("change");
        } else {
            window.location.href = redirect;
        }
        this.reRenderFooter();
    },

    addUser : function() {
        if (_.isEmpty(app.userForm)) {
            app.userForm = new UsersForm({model : app.usersModel});
        }
        app.usersModel.set(app.usersModel.defaults);
        app.userForm.render();
    },

    updUser : function (e) {
        $row = $(e.currentTarget);
        var userId = parseInt($row.data("id"));
        app.userForm.model = app.userCollection.get(userId);
        app.userForm.render();
    },
});



userForm = Backbone.View.extend({
    template : _.template($('#frmUsersTpl').html()),
    initialize : function() {
        //this.model.bind("change", this.render, this);
    },
    events : {
        'click #userBtn' : 'createUser',
        'click #resetBtn' : 'resetForm',
        "keyup input": "createOnEnter",
    },
    render : function() {
        // Render select
        $(this.el).html(this.template(this.model.toJSON()));
        return this;
    },

    // submit form when press enter
    createOnEnter: function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $(e.currentTarget).blur();
            $('#userBtn').trigger('click');
        }
    },

    createUser: function(e) {
        var $btn = $(e.currentTarget);
        var self =this;
        var id = $('#idInput').val();
        var isNew = (id != "") ? false : true;

        $('#errMessages').html('');
        var data = {
            username: $('input[name=username]', this.$el).val(),
            email: $('input[name=email]', this.$el).val(),
            first_name: $('input[name=first_name]', this.$el).val(),
            last_name: $('input[name=last_name]', this.$el).val(),
        };

        if (isNew) {

            // Create new user
            Backbone.Validation.bind(this);
            this.model.urlRoot = this.model.urlInsert;
            data.password = $('input[name=password]', this.$el).val();
            data.password_confirmation = $('input[name=password_confirmation]', this.$el).val();
        } else {
            // Update user
            Backbone.Validation.bind(this, {
                attributes: function(view) {
                    // only name and age will be validated
                    return ['username', 'first_name', 'last_name', 'email'];
                }
            });
            this.model.urlRoot = this.model.urlUpdate;
            if (!_.isEmpty($('input[name=password]', this.$el).val())) {
                data.password = $('input[name=password]', this.$el).val();
                data.password_confirmation = $('input[name=password_confirmation]', this.$el).val();
            }
            data._token = token;
        }
        this.model.set(data);
        // Check if the model is valid before saving
        if(this.model.isValid(true)){
            this.processSaveUser(data, $btn);
        }
    },

    processSaveUser: function(data, $btn) {
        var self = this;
        $btn.button('loading');
        this.model.save(data, {
            success: function(model, result) {
                if (200 == result.meta.code) {
                    app.userCollection.fetch({reset : true});
                    //self.model.set(self.model.defaults);
                    self.$el.html(self.template(self.model.defaults));
                    self.model.set(self.model.defaults);
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

    resetForm: function() {
        this.model.set(this.model.defaults);
        this.render();
    }
});

