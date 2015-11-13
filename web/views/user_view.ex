defmodule DragonHoard.UserView do
  use DragonHoard.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, DragonHoard.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, DragonHoard.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name}
  end
end
