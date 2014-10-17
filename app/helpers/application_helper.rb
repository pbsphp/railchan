module ApplicationHelper

  # Returns number of skipped comments (or nil)
  def skipped_comments(total)
    show = Settings.topic.comments_in_preview
    total - show > 0 ? total - show : nil
  end


  def post_author(author)
    a = author.present? ? author : Settings.topic.author
    truncate(a, length: 25)
  end


  def post_datetime(datetime)
    datetime.strftime("%d.%m.%Y %H:%M:%S")
  end


  def post_subject(subject)
    s = subject.present? ? subject : Settings.topic.subject
    truncate(s, length: 50)
  end


  def format_post_text(post_text)
    text = html_escape(post_text)

    text.gsub! /\n+/, "<br />"

    text.gsub! /&gt;&gt;(\d+)/, %Q[
      <a href="" onmouseover="showBubble(this, \\1)">
        &gt;&gt;\\1
      </a>]

    text.gsub! /&gt;&gt;T(\d+)/, %Q[
      <a href="javascript:;">
        &gt;&gt;T\\1
      </a>]

    # Truncate long lines
    # Why? Coz I fuckin' love regexes, that's why!
    text.gsub! /(\S{100})(?:\S++)/, %Q[\\1...]

    raw(text)
  end

end
