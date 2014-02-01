defmodule MarkdownServer.INotifyHandler do
  def inotify_event(pid, _event_tag, _msg) do
    :pg.send(pid, :reload)
    :ok
  end
end
