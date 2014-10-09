module ApplicationHelper


  # Returns number of skipped comments (or nil)
  def skipped_comments(total)
    show = Settings.global.comments_in_preview
    total - show > 0 ? total - show : nil
  end


  def ids_as_array(record)
    "[ #{record.collect(&:id).join(', ')} ]"
  end


  def post_author(author)
    author.present? ? author : Settings.global.author
  end


  def post_datetime(datetime)
    datetime.strftime("%d.%m.%Y %H:%M:%S")
  end


  def post_subject(subject)
    subject || Settings.global.subject
  end

end
