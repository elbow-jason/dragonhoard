defmodule DragonHoard.Router do
  use DragonHoard.Web, :router

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

  scope "/", DragonHoard do
    pipe_through :browser # Use the default browser stack
    get       "/",                PageController,             :index
  end

  scope "/api", DragonHoard do
    pipe_through :api
    resources "/users",           UserController,             except: [:new, :edit]
    resources "/shops",           ShopController,             except: [:new, :edit]
    resources "/products",        ProductController,          except: [:new, :edit]
    resources "/meta_items",      MetaItemController,         except: [:new, :edit]
    resources "/users",           UserController,             except: [:new, :edit]
    resources "/configurations",  ConfigurationController,    except: [:new, :edit]
  end
end
