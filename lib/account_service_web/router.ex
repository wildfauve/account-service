defmodule AccountServiceWeb.Router do
  use AccountServiceWeb, :router

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

  scope "/api", AccountServiceWeb do
    pipe_through :api # Use the API stack

    resources "/events", EventController, only: [:create, :index, :show]

    resources "/billing_entities", BillingEntityController, only: [:index, :show]
    post "/billing_entities/onboarding", BillingEntityController, :onboarding

    resources "/accounts", AccountController, only: [:create, :index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", AccountServiceWeb do
  #   pipe_through :api
  # end
end
