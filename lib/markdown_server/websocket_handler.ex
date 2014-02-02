defmodule MarkdownServer.WebSocketHandler do
  def init({:tcp, :http}, _req, _opts) do
    {:upgrade, :protocol, :cowboy_websocket}
  end

  def websocket_init(_transport_name, req, _opts) do
    :pg.join(:sockets_group, self())
    {:ok, req, :undefined_state}
  end

  def websocket_handle(_data, req, state) do
    {:ok, req, state}
  end

  def websocket_info({:pg_message, _from, _pg_name, :reload}, req, state) do
    {:reply, {:text, "reload"}, req, state}
  end
  def websocket_info(_info, req, state) do
    {:ok, req, state}
  end

  def websocket_terminate(_reason, _req, _state) do
    :ok
  end
end
