module ApplicationHelper

  # Returns number of skipped comments (or nil)
  def skipped_comments(total)
    show = Settings.topic.comments_in_preview
    total - show > 0 ? total - show : nil
  end


  def ids_as_array(record)
    "[ #{record.collect(&:id).join(', ')} ]"
  end


  def post_author(author)
    author.present? ? author : Settings.topic.author
  end


  def post_datetime(datetime)
    datetime.strftime("%d.%m.%Y %H:%M:%S")
  end


  def post_subject(subject)
    subject.present? ? subject : Settings.topic.subject
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

    raw(text)
  end

end
