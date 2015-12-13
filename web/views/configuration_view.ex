defmodule DragonHoard.ConfigurationView do
  use DragonHoard.Web, :view

  def render("index.json", %{configurations: configurations}) do
    %{data: render_many(configurations, DragonHoard.ConfigurationView, "configuration.json")}
  end

  def render("show.json", %{configuration: configuration}) do
    %{data: render_one(configuration, DragonHoard.ConfigurationView, "configuration.json")}
  end

  def render("configuration.json", %{configuration: configuration}) do
    %{
      id: configuration.id,
      name: configuration.name
    }
  end
end
