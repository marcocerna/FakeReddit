# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # Displays new post dynamically
  $('#post_button').click (event) ->
    event.preventDefault()

    $link = $('#post_link')
    $body = $('#post_body')
    $user_id = $('#post_user_id')

    post =
      post:
        link: $link.val()
        body: $body.val()
        user_id: $user_id.val()

    $.post("/posts", post).done (data) ->
      $('#all_posts').prepend(JST["templates/post"](post: data))

    $link.val("")
    $body.val("")
    $user_id.val("")



  # Displays all posts
  $.get("/posts.json").done (data) ->
    _.each data, (item) ->
      $('#all_posts').prepend(JST["templates/post"](post: item))



  # Displays new comment dynamically
  $('body').on "click", "#comment_button", (event) ->
    event.preventDefault()
    comment_id = $(this).data()["id"]
    $body = $('#comment_body[data-id="' + comment_id + '"]')
    $user_id = $('#comment_user_id[data-id="' + comment_id + '"]')
    $commentable_id = $('#comment_commentable_id[data-id="' + comment_id + '"]')
    $commentable_type = $('#comment_commentable_type[data-id="' + comment_id + '"]')

    comment =
      comment:
        body: $body.val()
        user_id: $user_id.val()
        commentable_id: $commentable_id.val()
        commentable_type: $commentable_type.val()

    $.post("/comments", comment).done (data) ->
      debugger
      $(".all_comments_#{ data.commentable_id }").append(JST["templates/comment"](comment: data))

  # Displays all comments
  $.get("/comments.json").done (data) ->

    _.each data, (item) ->
      $(".all_comments_#{ item.commentable_id }").append(JST["templates/comment"](comment: item))

