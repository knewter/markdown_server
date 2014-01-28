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
    "#{base_dir}#{conn.params["page"]}"
  end

  defp base_dir do
    "./test/support/sample_files/"
  end

  defp markdown_files, do: File.ls!(base_dir)
end
