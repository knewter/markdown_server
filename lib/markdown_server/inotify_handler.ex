defmodule MarkdownServer.INotifyHandler do
  def inotify_event(pid, event_tag, msg) do
    :pg.send(pid, :reload)
    :ok
  end
end
