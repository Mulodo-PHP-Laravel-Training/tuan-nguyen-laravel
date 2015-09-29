$(document).ready(function() {
    $.ajaxSetup({
    headers: {
        'X-CSRF-Token': token
    }
    });

    $('.editComment').click(function(event) {
        $btn = $(event.currentTarget);
        $comment = $btn.parent();
        $comment.closest('tbody').find('#frmComment').remove();
        // Cloning comment form
        $form = $('#frmComment').clone();
        $form.addClass('margin-top-10');
        $input = $('<input type="hidden" name="id" />');
        $input.val($btn.data('id'));
        $form.prepend($input);
        $('textarea', $form).val($btn.closest('td').find('.commentContent').html());
        $comment.append($form);
    });

    $('.deleteComment').click(function(event) {
        $btn = $(event.currentTarget);
        var id = $btn.data('id');
        var confirmMsg = confirm('Are you sure want to delete this comment?');
        if (confirmMsg) {
            $.ajax({
                url: urlBase+'/comment/' + id,
                type: 'DELETE',
                success: function(response) {
                    var successCode = 200;
                    alert(response.meta.messages[0].message);
                    if (successCode == response.meta.code) {
                        window.location.reload();
                    }
                }
            });
        }
    });

});
