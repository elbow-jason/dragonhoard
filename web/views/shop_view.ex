defmodule DragonHoard.ShopView do
  use DragonHoard.Web, :view

  def render("index.json", %{shops: shops}) do
    %{data: render_many(shops, DragonHoard.ShopView, "shop.json")}
  end

  def render("show.json", %{shop: shop}) do
    %{data: render_one(shop, DragonHoard.ShopView, "shop.json")}
  end

  def render("shop.json", %{shop: shop}) do
    %{
      id: shop.id,
      name: shop.name,
    }
  end
end
