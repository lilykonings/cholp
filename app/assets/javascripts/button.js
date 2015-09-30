var ready = function() {

    var p = $(location).attr('pathname');

    $('a.button[href="' + p + '"]').addClass('selected');
    $('a.button[href="/' + p.split('/')[1] + '"]').addClass('selected');

};

$(document).ready(ready);
$(document).on('page:load', ready);
