defmodule Hw06Web.Router do
  use Hw06Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug  Hw06Web.Plugs.FetchCurrentUser
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hw06Web do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true
    resources "/jobs", JobController
    resources "/timesheets", TimesheetController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hw06Web do
  #   pipe_through :api
  # end
end
