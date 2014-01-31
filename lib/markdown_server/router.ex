defmodule MarkdownServer.Router do
  def start_link do
    start()
  end

  use Phoenix.Router,
        port: 4000,
        dispatch: [
          { :_, [
              {"/stylesheets/[...]", :cowboy_static, {:dir, "priv/static/stylesheets"}},
              {"/javascript/[...]", :cowboy_static, {:dir, "priv/static/javascript"}},
              {"/ws", MarkdownServer.WebSocketHandler, {} },
              {:_, Plug.Adapters.Cowboy.Handler, { __MODULE__, [] }}
          ]}
        ]

  get "pages/:page", MarkdownServer.PagesController, :show,  as: :page
  get "pages",       MarkdownServer.PagesController, :index, as: :pages
end
