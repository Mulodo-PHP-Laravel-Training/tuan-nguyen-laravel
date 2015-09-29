$(document).ready(function() {
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
});
