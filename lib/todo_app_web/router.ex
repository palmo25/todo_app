defmodule TodoAppWeb.Router do
  use TodoAppWeb, :router

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

  scope "/", TodoAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/items", ItemController
    resources "/todolists", TodolistController, only: [:index, :create, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoAppWeb do
  #   pipe_through :api
  # end
end
