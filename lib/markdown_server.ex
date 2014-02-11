defmodule MarkdownServer do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    MarkdownServer.Supervisor.start_link
  end

  def base_dir do
    System.get_env("MARKDOWN_SERVER_DIR") || default_base_dir
  end

  defp default_base_dir do
    "./test/support/sample_files/"
  end
end
