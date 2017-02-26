module ApplicationHelper

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
      # CodeRay.scan(code, language).div(:line_numbers => :table)
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe

  end

  def image_by_category(name)
    images = {
      "Ruby"            => "select/ruby.png",
      "Rails4"          => "select/rails4.png",
      "Rails5"          => "select/rails5.png",
      "Heroku"          => "select/heroku.png",
      "AWS-Amazon"      => "select/aws.png",
      "Console/Shell"   => "select/shell.png",
      "Git"             => "select/git.png",
      "jQuery"          => "select/jquery.png"
    }
    images[name]
  end
end
