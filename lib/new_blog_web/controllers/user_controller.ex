defmodule NewBlogWeb.UserController do
  use NewBlogWeb, :controller

  alias NewBlog.Users

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.html", users: users, mood: "coolness")
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    posts = Users.posts(id)
    render(conn, "show.html", user: user, posts: posts)
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end