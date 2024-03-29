defmodule SecureLogWeb.Router do
  use SecureLogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SecureLogWeb do
    pipe_through :browser

    get "/", UserController, :index
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SecureLogWeb do
  #   pipe_through :api
  # end
end
