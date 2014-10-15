

commentsPath = "/comments"


# Get and render comment bubble

window.showBubble = (refObject, id) ->
    $.ajax({
        type: "GET",
        url: "#{commentsPath}/#{id}",
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
                minWidth: "300px"
            })
            .mouseleave(->
                $(this).remove()
            )
            .html(data)

            closestBubbleContainer.append(bubble)

            bubble.offset({
                left: $(refObject).offset().left - 10
                top: $(refObject).offset().top - 10
            })
    });


# Insert text to form textarea

window.insertIntoTextarea = (text) ->
    textarea = $(".post-textarea").first()
    value = textarea.val()
    strPos = textarea[0].selectionStart
    front = (value).substring(0, strPos)
    back = (value).substring(strPos, value.length)

    textarea.val("#{front}#{text}#{back}");
