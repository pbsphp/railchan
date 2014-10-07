
window.showBubble = (refObject, path) ->
    $.ajax({
        type: "GET",
        url: path,
        data: { part: true },
        dataType: "html",
        success: (data) ->
            closestBubbleContainer = $(refObject)
                                        .parents(".post")
                                        .first()
                                        .find(".bubbles-container").first()

            bubble = $("<div></div>", {
                "class": "bubble reply-bubble"
            })
            .css({
                position: "absolute"
            })
            .html(data)
            .mouseleave(->
                $(this).remove()
            )

            closestBubbleContainer.append(bubble)

            bubble.offset({
                left: $(refObject).offset().left - 10
                top: $(refObject).offset().top - 10
            })

            window.pid = bubble
            window.gay = refObject

    });
