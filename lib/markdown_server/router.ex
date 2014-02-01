defmodule MarkdownServer.Router do
  use Phoenix.Router,
        port: 4000,
        dispatch: [
          { :_, [
              {"/stylesheets/[...]", :cowboy_static, {:dir, "priv/static/stylesheets"}},
              {:_, Plug.Adapters.Cowboy.Handler, { __MODULE__, [] }}
          ]}
        ]

  get "pages/:page", MarkdownServer.PagesController, :show, as: :page
  get "pages",       MarkdownServer.PagesController, :index, as: :pages
end
