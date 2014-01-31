defmodule MarkdownServer.PagesView do
  use Eml

  def index_html(markdown_files) do
    markup = eml do
      html do
        head do
          title "Index"
          link [rel: "stylesheet", type: "text/css", href: "/stylesheets/base.css"], ""
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
          link [rel: "stylesheet", type: "text/css", href: "/stylesheets/base.css"], ""
        end
        body do
          rendered_document.body <> "<script type='text/javascript' src='/javascript/reloader.js'></script>"
        end
      end
    end
    Eml.write!(markup, escape: false)
  end
end
