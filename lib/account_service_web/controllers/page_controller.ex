defmodule AccountServiceWeb.PageController do
  use AccountServiceWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
