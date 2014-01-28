defmodule MarkdownServer.Router do
  use Phoenix.Router,
        port: 4000,
        dispatch: [{ :_, [{"/static/[...]", :cowboy_static, {:dir, "priv/static"}}, {:_, Plug.Adapters.Cowboy.Handler, { __MODULE__, [] }}]}]

  get "pages/:page", MarkdownServer.PagesController, :show, as: :page
  get "pages",       MarkdownServer.PagesController, :index, as: :pages
end
