postForm = Backbone.View.extend({
    template : _.template($('#frmPostsTpl').html()),
    initialize : function() {
        //this.model.bind("change", this.render, this);
    },
    events : {
        'click #postBtn' : 'savePost',
        'click #resetBtn' : 'resetForm',
        'keydown input': 'createOnEnter',
        'change .image': 'selectImage'
    },
    editor: null,
    render : function() {
        // Render grid
        $(this.el).html(this.template(this.model.toJSON()));
        this.editor = new TINY.editor.edit('editor',{
            id:'content',
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

    savePost: function(e) {
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
            status: parseInt($('input[name=status]:checked', this.$el).val()),
        };
        var picture = $('input[name="image"]')[0].files[0];
        var dataForm = new FormData();
        if (picture) {
            dataForm.append('image', picture);
        }
        dataForm.append('title', data.title);
        dataForm.append('content', data.content);
        dataForm.append('status', data.status);
        dataForm.append('_token', token);
        this.model.set(data);
        // Check if the model is valid before saving
        if(this.model.isValid(true)){
            if (isNew) {
                this.processCreatePost(dataForm, $btn);
            } else {
                this.processUpdatePost(dataForm,$btn);
            }
        }
    },

    processCreatePost: function(data, $btn) {
        var self = this;
        $btn.button('loading');
        $.ajax({
            url: urlBase + '/posts',
            cache: false,
            contentType: false,
            processData: false,
            data: data,
            type: 'POST',
            success: function(result){
                if (200 == result.meta.code) {
                    self.model.set(self.model.defaults);
                    self.render();
                    $message = $('<span class="text-success"></span>');
                    $message.html(result.meta.messages[0].message);
                    $('#errMessages').append($message);
                    $btn.button('reset');
                } else {
                    alert(result.meta.messages[0].message);
                    $btn.button('reset');
                }
            },
            error: function(data){
                alert('System error.');
                $btn.button('reset');
            }
          });
    },

    processUpdatePost: function(data, $btn) {
        var self = this;
        $btn.button('loading');
        $.ajax({
            url : urlBase + '/posts/' + $('#idInput').val(),
            cache: false,
            contentType: false,
            processData: false,
            data: data,
            type: 'POST',
            success: function(result) {
                if (200 == result.meta.code) {
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

    selectImage: function(e) {
        var input = e.target; // FileList object
        // Max image file size 1 MB
        var maxsize = 1000000;

        if (input.files && input.files[0]
            && (input.files[0].size < maxsize)
            && (input.files[0].type.indexOf('image/') == 0)) {

            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imgPreview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    },

    resetForm: function() {
        this.model.set(this.model.defaults);
        this.render();
    }
});

var AppRouter = Backbone.Router.extend({
    routes : {
        "" : "list",
    },
    // Step 1.3 : Set up initialization
    initialize : function() {
        this.postModel = new postModel();
        this.postForm = new postForm({
            el: $('#postForm'),
            model: this.postModel
        }).render();
    },

    list: function() {
    }
});

var app = new AppRouter();
Backbone.history.start();
