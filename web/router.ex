defmodule DragonHoard.Router do
  use DragonHoard.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DragonHoard do
    pipe_through :api# Use the default browser stack

    resources "/users", UserController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", DragonHoard do
  #   pipe_through :api
  # end
end
