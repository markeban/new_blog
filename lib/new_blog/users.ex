defmodule NewBlog.Users do
  import Ecto.Query, warn: false
  alias NewBlog.Repo

  alias NewBlog.User

  def list_users do
    Repo.all(User)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

end
