defmodule SecureLogWeb.PageController do
  use SecureLogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
