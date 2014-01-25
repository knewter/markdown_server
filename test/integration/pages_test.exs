defmodule Integration.PagesTest do
  use IntegrationTest.Case

  setup do
    start_server
    :ok
  end

  teardown do
    stop_server
  end

  test "renders an index of available files" do
    body = get("/pages")
    assert Regex.match?(%r/Index of markdown files/, body)
    assert Regex.match?(%r/basic/, body)
    assert Regex.match?(%r/middling/, body)
  end
end
