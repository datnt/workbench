var DemosController = Paloma.controller('Demos');

function DataHandler(data) {
    $('#url_str').val("");
    var str = "Source URL: <a href='" + data.link.source_url + "'>" + data.link.source_url + "</a><br>\n\
Shortened URL: <a href='" + data.link.shortened_url + "'>" + data.link.shortened_url + "</a><br>";

    $('#link_content').html(str);
}
function ConvertLink(url_str) {
    var create_path = "/api/v1/shortened_urls";
    $.ajax({
        type: "POST",
        url: create_path,
        data: {
            link: {
                url: url_str
            }
        },
        success: function(response) {
            $('span#short_note').remove();
            if (response.status.code == "error") {
                $('#link_content').html(response.status.message);
                //console.log(response.status.message);
            } else if (response.status.code == "success") {
                DataHandler(response.data);
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            console.log(thrownError)
            console.log("Error while connecting to server");
        }
    });
}


DemosController.prototype.new = function() {
    $(document).ready(function() {
        $('#btn_submit').click(function() {
            $(this).after("<span id='short_note'>Please wait...</span>");
            $('#link_content').html("");
            var str = $('#url_str').val();
            if (typeof str != "undefined" && str != "") {
                ConvertLink(str);
            }
        });
    });
}
$(document).on("keydown", "#url_str", function(e) {
    if (e.keyCode == 13) {
        $('#btn_submit').click();
        e.preventDefault();
    }
});