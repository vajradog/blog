module ApplicationHelper

 def display_datetime(dt)
   dt.strftime("%B %e")
 end

  def word_count(post)
    (post.body.to_s.split.size  / 214).round
  end
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      Rails.cache.fetch ["code", language, sha].join('-') do
        Pygments.highlight(code, lexer: language)
      end
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: false)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      disable_indented_code_blocks: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end