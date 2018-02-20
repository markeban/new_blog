defmodule NewBlogWeb.Router do
  use NewBlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    # plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NewBlogWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # get "/hello", HelloController, :index
    # get "/hello/:messenger", HelloController, :show


    resources "/posts", PostController
    resources "/users", UserController

    # resources "/users", UserController do
    #   resources "/posts", PostController
    # end
  end

  # Other scopes may use custom stacks.
  # scope "/api", NewBlogWeb do
  #   pipe_through :api
  # end
end
