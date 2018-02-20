defmodule NewBlogWeb.PageController do
  use NewBlogWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
