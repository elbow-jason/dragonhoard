defmodule DragonHoard.MetaItemView do
  use DragonHoard.Web, :view

  def render("index.json", %{meta_items: meta_items}) do
    %{data: render_many(meta_items, DragonHoard.MetaItemView, "meta_item.json")}
  end

  def render("show.json", %{meta_item: meta_item}) do
    %{data: render_one(meta_item, DragonHoard.MetaItemView, "meta_item.json")}
  end

  def render("meta_item.json", %{meta_item: meta_item}) do
    %{
      id: meta_item.id,
      name: meta_item.name,
      kind_of: meta_item.kind_of,
    }
  end
end
