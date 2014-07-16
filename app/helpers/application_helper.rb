module ApplicationHelper

 # def display_datetime(dt)
  #  dt.strftime("%B %e")
  #end

  # def word_count(post)
   #  (post.body.to_s.split.size  / 214).round
  #end
def markdown(text)
    options = {
      filter_html:     false,
      hard_wrap:       true,
      no_intra_emphasis: true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true,
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      strikethrough: true,
      underline: true,
      prettify: true

    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
