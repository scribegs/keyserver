defmodule KeyserverWeb.PageController do
  use KeyserverWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
