_.extend(Backbone.Validation.callbacks, {
    valid: function (view, attr, selector) {
        var $el = view.$('[name=' + attr + ']'),
            $group = $el.closest('.form-group');

        $group.removeClass('has-error');
        $group.find('.help-block').html('').addClass('hidden');
    },
    invalid: function (view, attr, error, selector) {
        var $el = view.$('[name=' + attr + ']'),
            $group = $el.closest('.form-group');

        $group.addClass('has-error');
        $group.find('.help-block').html(error).removeClass('hidden');
    }
});


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
        /*
        app.accountModel.fetch({data :  $.param({id : companyId}), success : function(model,response){
                app.accountForm.render();
                app.accountForm.selectCountry();
            }, error : function() {
                alertify.alert(lang.errorSystem);
        }});*/
    },
    delUser : function() {
        if (_.isEmpty(this.options.selected) || this.options.selected.length !=1) {
            // empty row
            // Notify message
            alertify.alert(lang.errorDeleteSelect);
        } else {
            var model = this.collection.get(this.options.selected[0]);
            if (parseInt(model.get('userStatus')) != 0) {
                alertify.alert(lang.errorDeleteUnActiveUser);
            } else {
                $('#modalDeleteUser').modal('show');
                // Create user form
                if (!app.deleteUserForm) {
                    app.deleteUserForm = new DeleteUserForm({model : new DeleteUsersModel()});
                }
                app.deleteUserForm.model.fetch({data : $.param({ id : parseInt(this.options.selected[0])}), success : function(model){
                    app.deleteUserForm.render();
                }, error : function() { alertify.alert(lang.errorSystem)}});

            }
            // Confirm delete
            /*
            var selectItem = this.options.selected;
            var self= this;
            if (!_.isEmpty(selectItem)) {
                var flag = true;
                _.each(selectItem, function(item) {
                    model = self.collection.get(item);
                    if (parseInt(model.get('userStatus')) != 0) {
                        flag =false;
                        $('tr[data-id='+item+'] input',self.$el).prop('checked',false);
                        self.options.selected.splice(self.options.selected.indexOf(item),1);
                    }
                });
                if (flag) {
                    _.each(selectItem,function (item) {
                        var model = self.collection.get(item);
                        // delete row
                        model.destroy({success : function(model, result) {
                            if (result.response == "failed") {
                                var msg = (result.msg) ? result.msg : lang.errorSystem;
                                alertify.alert(msg);
                            } else {
                                // send notify
                                alertify.success(lang.successDeleteUser);
                            }
                        }, error : function() { alertify.alert(lang.errorSystem)}});
                        self.collection.remove(self.collection.get(item));
                    });
                    // reset selected
                    self.options.selected = [];
                    // reload grid
                    self.collection.fetch({reset: true});
                    delete self;
                } else {
                    alertify.alert(lang.errorDeleteUnActiveUser);
                }

            }
            */

        }
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
		Backbone.Validation.bind(this);
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
			this.model.urlRoot = this.model.urlInsert;
			data.password = $('input[name=password]', this.$el).val();
			data.password_confirmation = $('input[name=password_confirmation]', this.$el).val();
			
		} else {
			this.model.urlRoot = this.model.urlUpdate;
			console.log($('input[name=password]', this.$el).val());
			if (!_.isEmpty($('input[name=password]', this.$el).val())) {
				data.password = $('input[name=password]', this.$el).val();
				data.password_confirmation = $('input[name=password_confirmation]', this.$el).val();				
			}
			data._token = token;
		}		
        this.model.set(data);				
        // Check if the model is valid before saving
        if(this.model.isValid(true)){
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

        }
    },
    createUser3 : function(e) {
        var self =this;
        var id = $('#idInput').val();
        var isNew = (id != "") ? false : true;
        //validate form
        var isValid = this.model.isValid();
        console.log(isValid);
        if (result) {
            this.model.save({
                username :_.escape($(this.id + ' #userNameInput').val()),
                password : _.escape($(this.id + ' #passwordInput').val()),
                userFullName : _.escape($(this.id + ' #userFullNameInput').val()),
                userEmail : _.escape($(this.id +' #userEmailInput').val()),
                isMember : ($(this.id + ' #isMember:checked').length > 0) ? 1 : 0,
            }, {success : function(model,result) {
                if (result.response == 'success') {
                    alertify.success(lang.successUser);
                    if (isNew) {
                        // fire event insert in backgrid to reload page
                        app.usersCollection.fetch({reset : true});
                        //self.model.set(self.model.defaults);
                        $('#createUser').html(self.template(self.model.defaults));
                    } else {
                        //window.location.href="";
                        app.usersCollection.fetch({reset : true});
                    }
                    app.usersGrid.setActiveRow(id);
                    $('#modalUsers').modal('hide');
                } else {
                    alertify.alert(result.msg);
                }
                //addLoadingState('#contactBtn');

            }, error : function() {
                alertify.alert(lang.failed);
                addLoadingState('#contactBtn');
            }
            });

        }
        e.preventDefault();
        return false;
    },

    resetForm: function() {
        this.model.set(this.model.defaults);
        this.render();
        console.log('here');
    }
});

