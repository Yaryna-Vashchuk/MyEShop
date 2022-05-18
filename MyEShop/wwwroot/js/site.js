﻿// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.
$(document).ready(function ()
{
    $("#show_hide_password a").on('click', function (event)
    {
        event.preventDefault();
        if ($('#show_hide_password input').attr("type") == "text")
        {
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass("fa-eye-slash");
            $('#show_hide_password i').removeClass("fa-eye");
        }
        else if ($('#show_hide_password input').attr("type") == "password")
        {
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass("fa-eye-slash");
            $('#show_hide_password i').addClass("fa-eye");
        }
    });
});
// Write your JavaScript code.
