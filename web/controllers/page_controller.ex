defmodule DragonHoard.PageController do
  use DragonHoard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
