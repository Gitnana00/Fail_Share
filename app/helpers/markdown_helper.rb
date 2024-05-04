module MarkdownHelper
  def markdown_to_html(markdown_text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, no_intra_emphasis: true, fenced_code_blocks: true, tables: true)
    markdown.render(markdown_text).html_safe
  end
end
