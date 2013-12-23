/**
 * Add Ajax functionality to pages
 */

$(function() {
    $('.pager a').on('click', function(e) {
        //$.get(this.href, null, null, 'script');
        $.getScript(this.href);
        e.preventDefault();
    });

    $("#projects th a").on("click", function(e) {
        $.getScript(this.href);
        e.preventDefault();
    });

    $("#projects_search").submit(function(e) {
        $.get($("#projects_search").attr("action"), $("#projects_search").serialize(), null, "script");
        e.preventDefault();
    });
});

