module ApplicationHelper


  # Returns number of skipped comments (or nil)
  def skipped_comments(options)
    total = options[:total]
    show = options[:show]
    total - show > 0 ? total - show : nil
  end


  def format_text(text, html_options={}, options={})
    html = simple_format(text, html_options, options)

    comments = "/comments"

    html.gsub!(/(?:>>|&gt;&gt;)(\d+)/, %Q{
      <a  class="reply-link"
          onmouseover="showBubble(this, '#{comments}/\\1')" href="">
        &gt;&gt;\\1
      </a>
    })

    html.html_safe
  end

end
