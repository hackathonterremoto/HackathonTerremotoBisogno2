/* Disabilita gestione delle form da parte di jquery, per evitare che il file upload non funzioni */

$(document).bind("mobileinit", function () {
    $.mobile.ajaxFormsEnabled = false;
});

