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

  def posts(user_id) do
    # Repo.one(from u in User, where: u.id == 1, preload: [:posts])
    Repo.one(from u in User, where: u.id == ^user_id, preload: [:posts]).posts
  end

end
