defmodule MarkdownServer.PagesView do
  use Eml

  def index_html(markdown_files) do
    markup = eml do
      html do
        head do
          title "Index"
        end
        body do
          h1("Index of markdown files")
          ul do
            Enum.map markdown_files, fn(file) ->
              li do
                a [href: "/pages/#{file}"], file
              end
            end
          end
        end
      end
    end
    Eml.write!(markup)
  end

  def html_for(rendered_document) do
    markup = eml do
      html do
        head do
          title rendered_document.title
        end
        body do
          rendered_document.body
        end
      end
    end
    Eml.write!(markup, escape: false)
  end
end
