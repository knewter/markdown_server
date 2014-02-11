defmodule MarkdownServer.PagesController do
  use Phoenix.Controller
  alias MarkdownServer.Renderer
  alias MarkdownServer.PagesView

  def show(conn) do
    document = conn |> requested_file |> Renderer.render
    html(conn, PagesView.html_for(document))
  end

  def index(conn) do
    html(conn, PagesView.index_html(markdown_files))
  end

  defp requested_file(conn) do
    "#{MarkdownServer.base_dir}#{conn.params["page"]}"
  end

  defp markdown_files do
    files |>
      Enum.filter(fn(filename) ->
        String.ends_with?(filename, [".md", ".markdown"])
      end)
  end

  defp files, do: File.ls!(MarkdownServer.base_dir)
end
