defmodule DragonHoard.PageControllerTest do
  use DragonHoard.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
