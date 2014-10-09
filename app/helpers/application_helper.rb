module ApplicationHelper


  # Returns number of skipped comments (or nil)
  def skipped_comments(options)
    total = options[:total]
    show = options[:show]
    total - show > 0 ? total - show : nil
  end


  def ids_as_array(record)
    "[ #{record.collect(&:id).join(', ')} ]"
  end


  def post_author(author)
    author.present? ? author : "Anonymous"
  end


  def post_datetime(datetime)
    datetime.strftime("%d.%m.%Y %H:%M:%S")
  end


  def post_subject(subject)
    subject || "Topic"
  end

end
