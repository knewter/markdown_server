defmodule MarkdownServer.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    :pg.create(:sockets_group)

    children = [
      # Define workers and child supervisors to be supervised
      worker(MarkdownServer.Router, []),
      worker(MarkdownServer.FileWatcher, [])
    ]

    # See http://elixir-lang.org/docs/stable/Supervisor.Behaviour.html
    # for other strategies and supported options
    supervise(children, strategy: :one_for_one)
  end
end
