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
            {field : "id", name : "Action", width : '100px', xtype : 'template',unsortable : true,
             tpl : _.template($('#actionButtonTpl').html()) }
        ],
        tbar : {
            search : {
                align : 'right'
            }
        }        
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



userForm = Backbone.View.extend({
    template : _.template($('#frmUsersTpl').html()),
    initialize : function() {
        //this.model.bind("change", this.render, this);
    },
    events : {
        'click #userBtn' : 'saveUser',
        'click #resetBtn' : 'resetForm',
        'keyup input': 'saveOnEnter',
    },
    render : function() {
        // Render select
        var userData = this.model.toJSON();
        $(this.el).html(this.template(userData));
        $('select[name=is_admin]').val(userData.is_admin);

        return this;
    },

    // submit form when press enter
    saveOnEnter: function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $(e.currentTarget).blur();
            $('#userBtn').trigger('click');
        }
    },

    saveUser: function(e) {
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
            is_admin: $('select[name=is_admin]', this.$el).val(),
            _token : token
        };
        if (isNew) {
            // Create new user
            Backbone.Validation.bind(this);
            data.password = $('input[name=password]', this.$el).val();
            data.password_confirmation = $('input[name=password_confirmation]', this.$el).val();
        } else {
            // Update user
            data = this.processUpdateUserData(data);
        }
        this.model.set(data);
        // Check if the model is valid before saving
        if(this.model.isValid(true)){
            this.processSaveUser(data, $btn);
        }
    },

    processUpdateUserData: function(data) {
        if (!_.isEmpty($('input[name=password]', this.$el).val())) {
            // Change password
            data.password = $('input[name=password]', this.$el).val();
            data.password_confirmation = $('input[name=password_confirmation]', this.$el).val();
            Backbone.Validation.bind(this);
        } else {
            Backbone.Validation.bind(this, {
                attributes: function(view) {
                    // not required password
                    return ['username', 'first_name', 'last_name', 'email'];
                }
            });                
        }
        data._token = token;
        return data;
    },

    processSaveUser: function(data, $btn) {
        var self = this;
        $btn.button('loading');
        this.$el.zecLoading({
            load: true,
            zone: '.form-inputs'
        });
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
                self.$el.zecLoading({
                    hide: true
                });                
            }, error: function() {
                $btn.button('reset');
                self.$el.zecLoading({
                    hide: true
                });                
            }
        });

    },

    resetForm: function() {
        this.model.set(this.model.defaults);
        this.render();
    }
});

