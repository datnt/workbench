var ShortenedUrlsController = Paloma.controller('ShortenedUrls');

ShortenedUrlsController.prototype.list = function() {
    $(document).on("click", ".api_stats", function(e) {
        $(this).after("<span id='short_note'>Please wait...</span>");
        var stats_path = "/api/v1/shortened_urls/stats";
        $.ajax({
            type: "GET",
            url: stats_path,
            data: {
                link: {
                }
            },
            success: function(response) {
                $('span#short_note').remove();
                console.log(response);
                var jsonStr = JSON.stringify(response.data);
                $('#editor').html(jsonStr);
                $('#modal_content').modal();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(thrownError)
                console.log("Error while connecting with server");
            }
        });
    });
}

ShortenedUrlsController.prototype.new = function() {
    $(document).on("mouseover", ".button_copy", function(e) {
        var mark_as_set = $("#link_detail").data("markit");
        if (mark_as_set == "setup_done") {
            //console.log("Stop Handler");
        }
        else {
            $("#link_detail").data("markit", "setup_done");//PREVENT SYSTEM TO INIT THE REPOST COMPONENTS AGAIN
            var sharebutton = $("#link_detail");

            var clip = new ZeroClipboard(sharebutton, {
                moviePath: "/assets/ZeroClipboard.swf"
            });
            clip.on("load", function(client) {
                client.on("complete", function(client, args) {
                    alert("Copied");
                });
            });
        }
    });
}