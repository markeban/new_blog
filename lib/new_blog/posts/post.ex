defmodule NewBlog.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias NewBlog.Posts.Post


  schema "posts" do
    field :body, :string
    field :title, :string
    belongs_to :user, NewBlog.User
    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    # require IEx; IEx.pry
    post
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end

# validate_required(cast(
#   post, attrs, [:title, :body, :user_id]),
#   [:title, :body, :user_id]
#   )
