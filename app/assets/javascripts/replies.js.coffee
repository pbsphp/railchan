

commentsPath = "/comments"


# Get and render comment bubble

window.showBubble = (refObject, id) ->

    console.log("Over: " + id)

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

            showRepliesListFor(bubble.find(".comment-replies").first())
            highlightRepliesInTextFor(bubble.find(".post .text").first())

    });



# Show >>N links under posts

window.showRepliesListFor = (element) ->
    replies = $(element).data("comment-replies")

    if replies
        for id in replies
            $("<a></a>")
                .attr("href", "")
                .html("&gt;&gt;!!!#{id}")
                .attr("onmouseover", "showBubble(this, #{id})")
                .appendTo($(element))



# Show >>N links under posts for each post on page

window.showRepliesList = ->

    $(".comment-replies").each (index) ->
        showRepliesListFor(this)



# Parse >>N in posts and make links

window.highlightRepliesInTextFor = (element) ->
    text = $(element).html()
    text = text.replace(/&gt;&gt;(\d+)/, """
        <a href="" onmouseover="showBubble(this, $1)">
            &gt;&gt;!!!$1
        </a>
    """)

    $(element).html(text)



# Parse >>N in posts and make links for each post on page

window.highlightRepliesInText = ->

    $(".post .text").each (index) ->
        highlightRepliesInTextFor(this)
