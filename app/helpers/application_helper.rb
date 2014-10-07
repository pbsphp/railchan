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

end
