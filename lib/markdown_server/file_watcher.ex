defmodule MarkdownServer.FileWatcher do
  def start_link do
    watcher = :inotify.watch(:erlang.binary_to_list(MarkdownServer.base_dir), :modify)
    :inotify.add_handler(watcher, MarkdownServer.INotifyHandler, :sockets_group)
    {:ok, self()}
  end
end
