(function() {
    /* Created by ronantuantvt
/* Email : ronantuantvt@gmail.com
/* Copyrights 2014
/* Required : boostrap3 , backbone 1.1, underscore, backbone-pageable 1.4.5
*/
    Backbone.View.prototype.parent = Backbone.Model.prototype.parent = Backbone.Collection.prototype.parent = function(attribute, options) {

        if (attribute == "inherit") {
            this.parent('initialize', options); // passes this.options to the parent initialize method

            //extends child events with parent events
            if (this.events) {
                $.extend(this.events, this.parent('events'));
                this.delegateEvents();
            }

            return;
        }
        return (_.isFunction(this.constructor.__super__[attribute])) ?
            this.constructor.__super__[attribute].apply(this, _.rest(arguments)) :
            this.constructor.__super__[attribute];
    };

    // addHash auto create , replace hash
    function addHash(key, id) {
        var hash = window.location.hash;
        // empty hash
        if (_.isEmpty(hash)) {
            hash = "#" + key + "/" + id;
        } else {
            // has hash
            var check = hash.search(key);
            // have key
            if (check >= 0) {
                patt = new RegExp(key + "\/[0-9]", "g");
                hash = hash.replace(patt, key + "/" + id);
            } else {
                // not have key
                hash += '/' + key + '/' + id;
            }
        }
        return hash;
    }

    // change button status to prevent multiple click
    // remove * if already loaded before
    /*
function addLoadingState(div,timer) {
    timer = (timer) ? timer : 1000;
    var $btn = $(div);
    $btn.button('loading');
    // simulating a timeout
    setTimeout(function () {
        $btn.button('reset');
    }, timer);
}

function formatMoney(money) {
    money = _.numberFormat(money,2,'.',',');
    if (_(money).strRight('.') == '00') {
        return money.replace('.00','');
    }
    return money;
}

*/


    function calcAutoHeight(item, bottomMargin) {
        var fromTop = item.find('tbody').offset().top + bottomMargin;
        return $(window).height() - fromTop;
    }


    var zecGrid = Backbone.View.extend({
        initialize: function(options) {
            //this.collection.on('reset', this.render, this);
            this.listenTo(this.collection, 'reset', this.render);
            this.options = options;
            this.options = _.defaults(this.options, {
                className: 'table', // table class name
                alphabet: false, // alphabet filter
                addUrl: true, // add #page/id when select page
                filter: false, // hide filter
                grouping: false, // grouping rows
                //scroll: false, // scroll table
                editable: false, // editable grid
                border: true, // border grid
                multiCheck: true,
                columns: [],
                pagination: true, // table have pagination
                selected: [], // list of selected row
                edited: 0, // edit selected row
                indexField: "id", // key field to edit or selected
                tbar: {} // top bar menu
            });
        },

        render: function() {
            this.options.selected = [];
            this.$el.empty();
            this.renderTable();
            var self = this;
            _.each($('thead select', this.el), function(select) {
                name = $(select).attr('name');
                if (self.collection.queryParams[name] != undefined) {
                    $(select).val(self.collection.queryParams[name]);
                }
            });
            $('.fbar .btn-toolbar').css('margin-left', '210px');
            this.afterRender(this);
            return this;
        },
        afterRender: function(t) {
            return t;
        },

        events: {
            'change select#selNumberPage': "paginPageSize",
            'click th.sortable': "sortPage",
            'click tbody tr': 'checkededRow',
            'click tbody tr.grouping': 'collapseGroup',
            //'dblclick tbody tr': 'selectedRow',
            //'click .selectedRow': 'clickSelectedRow',
            'click .selectedRow': 'selectedRow',
            'click input[type=checkbox]': 'selectModel', // click check box
            'click li.page': 'selectPage',
            'keyup input#filterInput': 'filterGrid',
            'change .filterRow select': 'selectFilter', // filter row by changing select
            'keyup .addRow input': 'createOnEnter',
            'keyup .editTable tbody input': 'updateOnEnter',
            'keyup input.filterInput': 'filterFieldGrid', // filter grid by press enter
            'click .btnFilter': 'filterFieldGrid',
            'click .alphabet': 'alphabetFilter',
            'click .btnRefresh': 'refreshPage',
            'mouseover tr': 'viewBtnGroup',
            'click .viewDetailItem': 'viewDetailItem',
            'click .goPage': 'goPage', // Jump page to abc
            'keyup .curPageInput ': 'goPageOnEnter', // Jump to page abc by Enter
            'click .read-more' :'expandRow', // show all row content when mouse over
        },

        // Change options when grid is extended
        mergeOptions: function(opts) {
            this.options = $.extend({}, this.options, opts)
        },

        renderTable: function() {
            if (!_.isEmpty(this.options.lgBar)) {
                this.$el.append(this.renderLgbar());
            }
            // check table have tbar
            if (!_.isEmpty(this.options.tbar)) {
                this.$el.append(this.renderTbar());
            }
            var $table = $('<table class="' + this.options.className + '"></table>');
            if (this.options.editable) $table.addClass('editTable');
            if (_.isEmpty(this.options.addCustomHeight))
                this.$el.addClass('zecGrid');
            else
                this.$el.addClass(this.options.addCustomHeight);
            this.$el.append($table);
            //$table.append(this.renderColGroup(this.options.columns));
            $table.append(this.renderHeader(this.options.columns));
            $table.append(this.renderRow());
            $table.append(this.renderFooter());
            if (this.options.border) $table.find('tbody').addClass('table-bordered');
        },

        renderColGroup: function(cols) {
            $colgroup = $('<colgroup></colgroup>');
            _.each(cols, function(col) {
                $col = $('<col></col>');
                if (col.width != '') $col.attr("width", col.width);
                $colgroup.append($col);
            });
            return $colgroup;
        },

        renderTbar: function() {
            var $tbar = $('<div class="tbar"></div>');
            // Filter
            if (!_.isEmpty(this.options.tbar.filter)) {
                var filter = this.options.tbar.filter;
                $filter = $('<div class="gridFilter col-sm-4"></div>');
                $input = $('<input type="search" id="filterInput" />');
                // add className
                if (_.isEmpty(filter.inputClassName)) {
                    $input.addClass("form-control");
                } else {
                    $input.addClass(filter.inputClassName);
                }
                $filter.append('<span class="input-group-btn"><span class="glyphicon glyphicon-search"></span></span>');

                $filter.append($input);
                $tbar.append($filter);
            }
            // Toolbar button
            if (!_.isEmpty(this.options.tbar.buttons)) {
                var buttons = this.options.tbar.buttons;
                $toolbar = $('<div role="toolbar"></div>');
                $tbar.append($toolbar);
                if (_.isEmpty(buttons.className)) {
                    $toolbar.addClass("btn-toolbar");
                } else {
                    $toolbar.addClass(buttons.className);
                }
                if (!_.isEmpty(buttons.data)) {
                    _.each(buttons.data, function(btn) {
                        // check permission
                        var p = (btn.permission != undefined) ? btn.permission : 1;
                        if (p) {
                            $btnGroup = $('<div class="btn-group"></div>');
                            $btn = $('<button type="button"></button>');
                            $btn.append(btn.name);
                            $btn.attr("id", btn.id);

                            if (_.isEmpty(btn.className)) {
                                $btn.addClass("btn btn-default btn-sm");
                            } else {
                                $btn.addClass(btn.className + ' btn-sm');
                            }

                            if (!_.isEmpty(btn.iconCls)) {
                                $btn.prepend('<span class="' + btn.iconCls + '"></span>&nbsp;');
                            }

                            if (!_.isEmpty(btn.attrs)) {
                                $btn.data(btn.attrs);
                                _.each(btn.attrs, function(attr, key) {
                                    $btn.attr('data-' + key, attr);
                                });
                            }
                            $btnGroup.append($btn);
                            $toolbar.append($btnGroup);
                        }
                    })
                }
            }
            return $tbar;
        },
        renderLgbar: function() {
            var $lgbar = $('<h3 class="lgBar"></h3>');
            $lgbar.append(this.options.lgBar.name);
            // Toolbar button
            //if(!_.isEmpty(this.collection.models))
            if (!_.isEmpty(this.options.lgBar.buttons)) {
                var buttons = this.options.lgBar.buttons;
                if (!_.isEmpty(buttons.data)) {
                    _.each(buttons.data, function(btn) {
                        var p = (btn.permission != undefined) ? btn.permission : 1;
                        if (p) {
                            $btnGroup = $('<span class="pull-right"></span>');
                            $btn = $('<button type="button"></button>');
                            $btn.append(btn.name);
                            $btn.attr("id", btn.id);

                            if (_.isEmpty(btn.className)) {
                                $btn.addClass("btn btn-default");
                            } else {
                                $btn.addClass(btn.className);
                            }

                            if (!_.isEmpty(btn.iconCls)) {
                                $btn.prepend('<span class="' + btn.iconCls + '"></span>&nbsp;');
                            }

                            if (!_.isEmpty(btn.attrs)) {
                                $btn.data(btn.attrs);
                                _.each(btn.attrs, function(attr, key) {
                                    $btn.attr('data-' + key, attr);
                                });
                            }
                            $btnGroup.append($btn);
                            $lgbar.append($btnGroup);

                        }
                    })
                }
            }
            return $lgbar;
        },
        renderHeader: function(cols) {
            $thead = $('<thead></thead>');
            $trhead = $('<tr></tr>');
            $thead.append($trhead);
            var sortKey = this.collection.state.sortKey;
            var direction = this.collection.state.order;
            var self = this;
            _.each(cols, function(col) {
                $th = $('<th></th>');
                if ((col.xtype == 'checkbox' && !self.options.editable) || (col.xtype == 'checkbox' && self.options.editable && col.name == '')) {
                    if (self.options.multiCheck)
                        $th.append('<input type="checkbox" id="checkedAll" />');
                } else {
                    $th.append(col.name);
                    $th.attr("data-field", col.field);
                    if (col.unsortable) {
                        $th.addClass("unsortable");
                    } else {
                        $th.addClass("sortable");
                        if (sortKey == col.field) {
                            if (direction == 1) {
                                $th.append('&nbsp;<span class="glyphicon glyphicon-arrow-down"></span>');
                            } else {
                                $th.append('&nbsp;<span class="glyphicon glyphicon-arrow-up"></span>');
                            }
                        }
                    }
                }
                if (col.width != '') {
                        $th.attr('width',col.width);
                }
                $trhead.append($th);
            });

            // Add alphabet filter
            if (this.options.alphabet == true) {
                var alphabet = ['All','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
                $abc = $('<tr></tr>');
                $td = $('<td class="alphabetFilter"></td>');
                $td.attr('colspan', cols.length);
                _.each(alphabet, function(word) {
                    $span = $('<span class="alphabet"></span>');
                    $span.attr("data-alphabet", word);
                    // add active class
                    activeAlphabet = self.collection.queryParams.alphabet;
                    if (activeAlphabet != null && activeAlphabet == word) {
                        $span.addClass("active");
                    }
                    $span.append(word);
                    $td.append($span);
                })
                $abc.append($td);
                $thead.prepend($abc);
            }

            // filter columns
            if (this.options.filter) {
                $thead.append(this.renderFilter());
            }

            if (this.options.addable) {
                $thead.append(this.renderAddRow());
            }

            return $thead;
        },

        renderFilter: function() {
            $tr = $('<tr></tr>');
            $tr.addClass("filterRow");
            var self = this;
            _.each(this.options.columns, function(col) {
                $td = $('<td></td>');
                if (col.filter) {
                    $div = $('<div></div>');
                    if (col.filter.xtype == 'text') {
                        $inputGroup = $('<div class="input-group"></div>');
                        if (col.filter.classWidth) {
                            $inputGroup.addClass(col.filter.classWidth);
                        }
                        $input = $('<input type="text" />');
                        if (col.filter.className) {
                            $input.addClass("filterInput");
                            $input.addClass(col.filter.className);
                        } else {
                            $input.addClass("form-control filterInput");
                        }
                        $input.attr("data-field", col.field);
                        if (self.collection.queryParams[col.field] != null) {
                            $input.val(self.collection.queryParams[col.field]);
                        }
                        // add button submit when filter.hasSubmit == true
                        if (col.filter.hasSubmit) {
                            $btnGroup = $('<span class="input-group-btn"></span>');
                            $btnSearch = $('<button class="btn btn-default btnFilter"><span class="glyphicon glyphicon-search"></span></button>');
                            $btnGroup.append($btnSearch);
                            $inputGroup.prepend($btnGroup);
                        }
                        $inputGroup.prepend($input);
                    } else if (col.filter.xtype == 'date') {
                        $inputGroup = $("<div></div>");
                        $input = $('<input type="text" class="form-control filterInput" />');
                        $input.attr("data-field", col.field);
                        if (self.collection.queryParams[col.field] != null) {
                            $input.val(self.collection.queryParams[col.field]);
                        }
                        $input.focus(function() {
                            if ($(this).val() === '') {
                                var today = new Date();
                                var dd = today.getDate();
                                var mm = today.getMonth() + 1; //January is 0!
                                var yyyy = today.getFullYear();

                                if (dd < 10) dd = '0' + dd;
                                if (mm < 10) mm = '0' + mm;
                                today = dd + '-' + mm + '-' + yyyy;
                                $(this).val(today);
                            }
                        });
                        $inputGroup.append($input);
                    } else if (col.filter.xtype == 'none') {
                        // Empty filter row
                        $inputGroup = $('<div class="input-group input-height">&nbsp;</div>');

                    } else if (col.filter.xtype == 'html') {
                        // Render by html
                        $inputGroup = $('<div></div>');
                        $inputGroup.css('overflow', 'hidden');
                        $inputGroup.append(col.filter.tpl);
                    }
                    $div.append($inputGroup);
                    $td.append($div);
                }
                $tr.append($td);
            });
            return $tr;
        },

        renderAddRow: function() {
            $tr = $('<tr></tr>');
            $tr.addClass("addRow");
            var self = this;
            $tr.attr("data-id", -1);
            _.each(this.options.columns, function(col) {
                $tr.append(self.renderEditableRow(col, null, true));
            });
            return $tr;

        },


        renderRow: function() {
            var $tbody = $('<tbody></tbody>');
            var self = this;
            if (_.isEmpty(this.collection.models) || ( _.isEmpty(this.collection.models[1]) && this.collection.models[0].attributes.response=='failed')){
                // Empty result
                $tr = $('<tr class="empty-row"></tr>');
                $td = $('<td></td>');
                $td.attr('colspan', this.options.columns.length);
                $td.html('Empty data.');

                $tr.append($td);
                $tbody.append($tr);
            } else {
                if (this.options.editable) {
                    // editable grid
                    _.each(this.collection.models, function(model) {
                        $tr = $('<tr></tr>');
                        $tr.attr("data-id", model.get(self.options.indexField));
                        $tbody.append($tr);
                        _.each(self.options.columns, function(col) {
                            //$tr.append($td);
                            $tr.append(self.renderEditableRow(col, model));
                        });

                    });

                } else {
                    if (this.options.grouping) {
                        // Grouping columns
                        // set comparator
                        this.collection.comparator = this.options.groupField;
                        // sort collection
                        this.collection.sort();

                        var flagGroup = true;
                        var id = null;
                        _.each(this.collection.models, function(model) {
                            if (id == model.get(self.options.groupField)) {
                                flagGroup = false;
                            } else {
                                flagGroup = true;
                            }
                            id = model.get(self.options.groupField);
                            if (flagGroup) {
                                $tr = $('<tr></tr>');
                                $tr.addClass("grouping");
                                $tr.attr("data-id", 0);
                                $tr.attr("data-group", model.get(self.options.groupField));
                                $td = $('<td></td>');
                                $td.attr("colspan", self.options.columns.length);
                                $td.append(model.get(self.options.groupFieldName));
                                $tr.append($td);
                                $tbody.append($tr);
                            }
                            $tr = $('<tr></tr>');
                            $tr.attr("data-id", model.get(self.options.indexField));
                            $tr.attr("data-group", model.get(self.options.groupField));
                            $tbody.append($tr);
                            _.each(self.options.columns, function(col) {
                                $td = $('<td></td>');
                                if (col.xtype == 'checkbox') {
                                    $td.addClass("unSelect");
                                    $td.append(self.renderCheckBox(model.get(self.options.indexField)));
                                }
                                if (col.xtype == 'money') {
                                    $td.append(formatMoney(model.get(col.field)));
                                } else {
                                    $td.append(model.get(col.field));
                                }

                                $tr.append($td);
                            });

                        });

                    } else {
                        // normal rows
                        _.each(this.collection.models, function(model) {
                            $tr = $('<tr></tr>');
                            $tr.attr("data-id", model.get(self.options.indexField));
                            $tbody.append($tr);
                            _.each(self.options.columns, function(col,idx) {
                                $td = $('<td></td>');
                                if (col.xtype == 'checkbox') {
                                    $td.addClass("unSelect");
                                    $td.append(self.renderCheckBox(model.get(self.options.indexField)));
                                }
                                if (col.xtype == 'money') {
                                    $td.append(formatMoney(model.get(col.field)));
                                } else if (col.xtype == 'template') {
                                    $td.append(col.tpl({
                                        field: model.get(col.field)
                                    }));
                                    if (!_.isEmpty(col.field)) {
                                        $('select', $td).val(model.get(col.field));
                                    }

                                } else {
                                    $td.append(model.get(col.field));
                                }
                                if (col.selectedField) {
                                    $td.wrapInner('<span class="selectedRow"></span');
                                }

                                if (col.viewable) {
                                    $td.append('<span style="visibility:hidden;margin-left: 10px;" title="Chi tiáº¿t" class="viewDetailItem"><span class="glyphicon glyphicon-eye-open"></span></span>');
                                }

                                if (col.autoHide) {
                                    var line = $td.text().split(/\r\n|\r|\n/).length;
                                    $td.wrapInner('<div class="reveal-closed"></div>');
                                    //console.log($('.reveal-closed',$td)[0].clientHeight);
                                    if (line > 5) {
                                        $td.append('<a href="javascript:void(0);" class="read-more">. . .</a>');
                                    }
                                }
                                $tr.append($td);
                            });

                        });

                    } // end if

                }

            }
            return $tbody;
        },

        renderEditableRow: function(col, model, addRow) {
            var self = this;
            $td = $('<td></td>');
            if (col.xtype == 'none') {
                if (col.ftype == 'money') {
                    $td.append(formatMoney(model.get(col.field)));
                } else {
                    $td.append(model.get(col.field));
                }

            } else if (col.xtype == 'checkbox') {
                $input = $('<input type="checkbox" value="" class="form-control widthAuto" />');
                $input.attr('name', col.field);
                if (col.name == '') {
                    $input.addClass("checkedRow");
                }

                if (model && model.get(col.field) == 1) {
                    $input.prop("checked", "checked");
                }
                if (col.name == '') $input.attr("data-id", model.get(self.options.indexField));
                $td.append($input);
                //$td.append(self.renderCheckBox(model.get(self.options.indexField)));
            } else if (col.xtype == 'selectbox') {
                $select = col.template();
                $td.append($select);
                //$("select option:contains(text)").attr('selected', true);
                if (col.select == 'value') {
                    if (model.get(col.field) > 0) $('select', $td).val(model.get(col.field));
                } else {
                    $('select option:contains(' + model.get(col.field) + ')', $td).attr('selected', true);
                }
                //$('select',$td).selectpicker({width : '100%'});
            } else if (col.xtype == 'template') {

                if (model == null) {
                    $td.append(col.tplAdd);
                } else {
                    $td.append(col.tpl);
                }

            } else if (col.xtype == 'group') {


                $inputGroup = $('<div class="input-group"></div>');
                $input = $('<input type="hidden" name="' + col.hiddenField + '" value="">');
                if (_.isObject(model)) $input.val(model.get(col.hiddenField));
                $inputGroup.append($input);
                $input = $('<input type="text" name="' + col.field + '"" class="form-control" disabled="" value="" />');
                if (_.isObject(model)) $input.val(model.get(col.field));
                $inputGroup.append($input);
                if (col.buttons) {
                    $groupBtn = $('<span class="input-group-btn"></span');
                    $inputGroup.append($groupBtn);
                    _.each(col.buttons, function(button) {
                        $button = $('<button type="button"></button');
                        if (button.className) {
                            $button.addClass(button.className);
                        } else {
                            $button.addClass("btn btn-default");
                        }
                        if (!_.isEmpty(button.attrs)) {
                            _.each(button.attrs, function(attr, key) {
                                $button.attr(key, attr);
                            })
                        }
                        if (!_.isEmpty(button.icon)) {
                            $icon = $('<span></span>');
                            $icon.addClass(button.icon);
                            $button.append($icon);
                        }
                        if (button.label) {
                            $button.append(button.label)
                        } else {
                            $button.append('&nbsp;');
                        }
                        $groupBtn.append($button);
                    });
                }

                $td.append($inputGroup);
            } else { // default input
                $input = $('<input type="text" class="form-control" />');
                if (col.xtype == 'number') {
                    //pattern="[0-9.]+"
                 //   $input.attr('pattern', '[0-9.]+');
                }
                if (!_.isEmpty(col.width)) {
                    $input.css('width', col.inputWidth);
                }
                if (_.isString(col.defaultValue)) {
                    $input.attr('value', col.defaultValue);
                } else {
                    if (_.isObject(model)) {
                        if (col.xtype == 'number') {
                            $input.val(formatMoney(model.get(col.field)));
                        } else {
                            $input.val(model.get(col.field));
                        }

                    }
                }
                if (!_.isEmpty(col.className)) {
                    $input.addClass(col.className);
                }

                $input.attr('name', col.field);

                $td.append($input);

            }

            return $td;

        },

        renderFooter: function() {
            $tfoot = $('');
            // have pagination
            if (this.options.pagination) {
                $tfoot = $('<tfoot></tfoot>');
                $tr = $('<tr></tr>');
                $tfoot.append($tr);
                $tr.append(this.pagination());
            }
            return $tfoot;
        },

        reRenderFooter: function() {
            $('tfoot tr', this.$el).remove();
            $tr = $('<tr></tr>');
            $('tfoot', this.$el).append($tr);
            $tr.append(this.pagination());
        },

        renderCheckBox: function(index) {
            $input = $('<input type="checkbox" />');
            $input.attr("data-id", index);
            return $input;
        },

        pagination: function() {
            this.currentPage = this.collection.state.currentPage;
            this.Pages = this.collection.state.totalPages;
            this.pageSize = parseInt(this.collection.state.pageSize);
            $pagin = $('<td colspan="' + this.options.columns.length + '"></td>');
            $ul = $('<ul class="pagination"></ul>');
            $pagin.append($ul);

            if (this.collection.state.totalPages > 1) {
                $ul.append('<li class="selNumberPage"><select class="form-control" id="selNumberPage"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select></li>');
                $('select', $ul).val(this.pageSize);

                // Add jumpage
                $li = $('<li class="currentPageInput"></li>');
                $inputGroup = $('<label class="control-label">Page:</label><div class="input-group"><input value="' + this.currentPage + '" class="form-control curPageInput" /><span class="input-group-btn"><button type="button" class="btn btn-default goPage">Go</button></span></div>');
                $li.append($inputGroup);
                $ul.append($li);
                // end jumpage

                if (this.options.addUrl) { // Add url page
                    var hash = location.hash;
                    $ul.append('<li class="page"><a href="' + addHash('page', 1) + '">&laquo;</a></li>');

                    // Calculate page
                    this.startPage = Math.max(1, this.currentPage - 2);
                    this.endPage = Math.min(this.Pages, this.startPage + 4);
                    lengthPage = this.endPage - this.startPage;
                    if (lengthPage < 5) this.startPage = Math.max(this.startPage - (4 - lengthPage), 1);
                    // load page
                    for (var i = this.startPage; i <= this.endPage; i++) {
                        $li = $('<li></li>');
                        $li.addClass("page");
                        if (i == this.currentPage) {
                            $li.addClass("active");
                            //                      $li.append('<input class="currentPage" name="currentPage" value="'+i+'" />');
                        } else {

                        }
                        $li.append('<a href="' + addHash('page', i) + '">' + i + '</a>');
                        $ul.append($li);
                    }
                    $ul.append('<li><a href="' + addHash('page', this.Pages) + '">&raquo;</a></li>');
                } else { // not add url
                    $ul.append('<li class="page" data-page="1"><a>&laquo;</a></li>');

                    // Calculate page
                    this.startPage = Math.max(1, this.currentPage - 2);
                    this.endPage = Math.min(this.Pages, this.startPage + 4);
                    lengthPage = this.endPage - this.startPage;
                    if (lengthPage < 5) this.startPage = Math.max(this.startPage - (4 - lengthPage), 1);
                    // load page
                    for (var i = this.startPage; i <= this.endPage; i++) {
                        $li = $('<li class="page" data-page="' + i + '"></li>');
                        if (i == this.currentPage) {
                            $li.addClass("active");
                            //$li.removeClass("page");
                            //$li.append('<input class="currentPage form-control" name="currentPage" value="'+i+'" />');
                        } else {

                        }

                        $li.append('<a>' + i + '</a>');
                        $ul.append($li);
                    }
                    $ul.append('<li class="page" data-page="' + this.Pages + '"><a>&raquo;</a></li>');

                }

            } else {
                // numpage > 10 -> maybe have pagination
                if (this.pageSize > 10) {
                    $ul.append('<li class="selNumberPage"><select class="form-control" id="selNumberPage"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select></li>');
                    $('select', $ul).val(this.pageSize);
                }

            }
            return $pagin;
        },

        // Jump page to abc
        goPage: function() {
            var curPage = parseInt($('input.curPageInput', this.el).val());
            this.jumpPage(curPage);
        },

        goPageOnEnter: function(e) {
            if (e.keyCode == 13) { // press Enter
                var curPage = parseInt($(e.currentTarget).val());
                this.jumpPage(curPage);
            }
        },

        jumpPage: function(curPage) {
            if (isNaN(curPage)) curPage = 1;
            curPage = Math.max(1, curPage);
            curPage = Math.min(curPage, this.collection.state.totalPages);
            if (this.options.addUrl) { // Add url page
                $('input.curPageInput', this.el).val(curPage);
                window.location = addHash('page', curPage);
            } else {
                this.collection.state.currentPage = curPage;
                this.fetchCollection();

            }
        },

        paginPage: function(page) {
            var curPage = page.currentTarget.innerHTML;
            this.collection.state.currentPage = curPage;
        },

        paginPageSize: function(page) {
            var self = this;
            this.pageSize = parseInt($(page.currentTarget).val());
            this.collection.state.pageSize = this.pageSize;
            this.collection.state.currentPage = 1;
            this.$el.zecLoading({
                load: true,
                zone: '.slimScrollDiv'
            });
            this.collection.fetch({
                reset: true,
                success: function() {
                    self.$el.zecLoading({
                        hide: true
                    });
                }
            });
        },

        selectPage: function(e) {
            // not set URL
            if (!this.options.addUrl) {
                var li = e.currentTarget;
                this.collection.state.currentPage = $(li).data("page");
                //this.collection.fetch({reset : true});
                this.fetchCollection();
            }
        },

        // Sort Grid
        sortPage: function(th) {
            var field = $(th.currentTarget).data("field");
            direction = this.collection.state.order;
            sortKey = this.collection.state.sortKey;
            //change direction
            if (field == sortKey) {
                if (direction == 1) { // desc
                    $(th.currentTarget, this.$el).find('span').removeClass().addClass("glyphicon glyphicon-arrow-up");
                    this.collection.state.order = -1;

                } else { // asc
                    $(th.currentTarget, this.$el).find('span').removeClass().addClass("glyphicon glyphicon-arrow-down");
                    this.collection.state.order = 1;
                }

            } else {
                this.collection.state.sortKey = field;
            }
            if (!_.isEmpty(this.collection.models)) {
                this.fetchCollection();
            }
        },

        fetchCollection: function() {
            this.$el.zecLoading({
                load: true,
                zone: '.slimScrollDiv'
            });
            var self = this;
            this.collection.fetch({
                reset: true,
                success: function() {
                    self.$el.zecLoading({
                        hide: true
                    });
                },
                error: function() {
                    self.$el.zecLoading({
                        hide: true
                    });
                    alertify.alert(lang.errorSystem);
                }
            });
        },

        // collapse group
        collapseGroup: function(e) {
            var group = $(e.currentTarget).data("group");
            $(this.el).find("tr:not(.grouping)[data-group=" + group + "]").toggle();
        },

        selectModel: function(e) {
            var checkbox = e.currentTarget;
            var $td = $(e.currentTarget).parent();
            var index = $td.index();
            var self = this;
            if (checkbox.id == "checkedAll") { // check all items
                var checked = $(checkbox).prop("checked");
                if (checked) { // check all
                    $('tbody > tr', this.$el).addClass("selected info");
                    $('tbody > tr', this.$el).each(function(i, obj) {
                        $('td', obj).eq(index).find("input[type=checkbox]").prop("checked", true);
                        var idx = parseInt($(obj).data("id"));
                        if (idx > 0) {
                            self.options.selected.push(idx);
                        } else if (idx < 0) {
                            self.options.selected.push(idx);
                        }

                    });
                } else { // uncheck all
                    $('tbody > tr', this.$el).removeClass("selected info");
                    $('tbody > tr', this.$el).each(function(i, obj) {
                        $('td', obj).eq(index).find("input[type=checkbox]").prop("checked", false);
                    });

                    //$("input[type=checkbox].checkedRow", this.$el).prop("checked",false);
                    // remove selected items
                    this.options.selected = [];
                }
            } else { // check item
                var checked = $(checkbox).prop("checked");
                $(checkbox).parent().parent().toggleClass("selected").toggleClass("info").remove("danger");
                if (checked) {
                    this.options.selected.push($(checkbox).data("id"));
                } else {
                    var idx = this.options.selected.indexOf($(checkbox).data("id"));
                    this.options.selected.splice(idx, 1);
                }

            }
        },
        // remove all seleted items
        unSelected: function() {
            this.options.selected = [];
            $('tbody > tr', this.$el).removeClass("selected info");
            $("input[type=checkbox]", this.$el).prop("checked", false);
        },

        // checked row
        checkededRow: function(e) {
            var tr = e.currentTarget;
            if (!$(tr).hasClass("empty-row") && !$(e.target).parent().hasClass("unSelect")) { // not select empty row
                $('tr', this.$el).removeClass("danger");
                $(tr).addClass("danger");
            }
        },

        // selected row
        selectedRow: function(e) {
            var tr = e.currentTarget;
            var itemId = $(tr).parents('tr').data("id");
            if (!$(tr).hasClass("empty-row") && !$(e.target).parent().hasClass("unSelect")) { // not select empty row
                $('tr', this.$el).removeClass("daselectednger success");
                $(tr).addClass("danger");
                if (parseInt(itemId) > 0) {
                    this.options.edited = parseInt(itemId);
                }
                // Rerender pagination
            }
        },

        clickSelectedRow: function(e) {
            $(e.currentTarget).parent().parent().trigger('dblclick');
        },

        setActiveRow: function(id) {
            var row = $('tr[data-id=' + id + ']', this.$el);
            $(row).addClass("success");
            this.options.edited = parseInt(id);
        },

        selectFilter: function(e) {
            var name = $(e.currentTarget).attr('name');
            var value = $(e.currentTarget).val();
            this.collection.queryParams[name] = value;
            this.collection.state.currentPage = 1;
            $('.filterRow select[name=' + name + ']', this.$el).val(value);
            /*
        if (!_.isEmpty(this.collection.models)) {
            this.fetchCollection();
        }
        */
            this.fetchCollection();
        },

        filterGrid: function(e) {
            if (e.keyCode == 13) {
                var key = $(e.currentTarget).val();
                this.collection.queryParams.q = key;
                this.collection.state.currentPage = 1;
                /*
            if (!_.isEmpty(this.collection.models)) {
                this.fetchCollection();
            }  */
                this.fetchCollection();
            }
        },

        createOnEnter: function(e) {
            if (e.keyCode == 13) {
                $('thead .addBtn', this.el).trigger('click');
            }
        },

        updateOnEnter: function(e) {
            if (e.keyCode == 13) {
                $row = $(e.currentTarget).parents("tr");
                $row.find('.updBtn').trigger('click');
                $row.removeClass().addClass("success");
            }
        },

        filterFieldGrid: function(e) {
            if (e.keyCode == 13 || $(e.currentTarget).hasClass("btnFilter")) {
                var self = this;
                $.each($('tr[class=filterRow] td input', this.$el), function(idx, row) {
                    var key = $(row).val();
                    var field = $(row).data("field");
                    if (key != '') {
                        self.collection.queryParams[field] = key;
                    } else {
                        self.collection.queryParams[field] = undefined;
                    }
                });

                this.collection.state.currentPage = 1;
                this.fetchCollection();
                /*
                if (!_.isEmpty(this.collection.models)) {
                    this.fetchCollection();
                } */
            }
        },

        alphabetFilter: function(e) {
            var element = $(e.currentTarget);
            var alphabet = element.data("alphabet");
            if (alphabet == 'All') {
                this.collection.queryParams.alphabet = null;
            } else {
                this.collection.queryParams.alphabet = alphabet;
            }
            this.collection.state.currentPage = 1;
            /*
            if (!_.isEmpty(this.collection.models)) {
                this.fetchCollection();
            } */
            this.fetchCollection();
        },

        // refresh page
        refreshPage: function(e) {
            var self = this;
            if (!_.isEmpty(this.collection.defaultState)) {
                // Load default param
                _.each(this.collection.defaultState, function(state, idx) {
                    self.collection.state[idx] = state;
                });
                // clear filter row
                $('tr[class=filterRow] input').val('');
                _.each($('tr[class=filterRow] input'), function(input) {
                    var field = $(input).data("field");
                    // rest filter params
                    self.collection.queryParams[field] = null;
                })
                // reset alphabet
                if (this.options.alphabet) {
                    this.collection.queryParams.alphabet = null;
                }
                this.fetchCollection();
            }
            addLoadingState('#' + $(e.currentTarget).attr("id"));
        },

        // Show/hide btn group
        viewBtnGroup: function(e) {
            var tr = $(e.currentTarget);
            $('.groupBtn', this.$el).hide();
            $('.groupBtn', tr).show();
            $('.viewDetailItem', this.$el).css('visibility','hidden');
            $('.viewDetailItem', tr).css('visibility','show');
        },

        viewDetailItem: function(e) {
            //$(e.currentTarget).parents("tr").trigger('dblclick');
        },

        // Show all content when mouse over
        expandRow : function(e) {
            $td = $(e.currentTarget).parent('td');
            $td.find('.reveal-closed').toggleClass("reveal-closed").toggleClass("reveal-open");
            $td.css({"height" : "auto"});
            $td.find('.read-more').remove();
        }

    });

    Backbone.zecGrid = zecGrid;

})();