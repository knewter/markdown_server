var sock = new WebSocket("ws://" + window.location.host + "/ws");
sock.onmessage = function(msg) {
  if(msg.data === "reload"){
    location.reload(true);
  }
}
