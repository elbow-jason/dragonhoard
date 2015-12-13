defmodule DragonHoard.ProductView do
  use DragonHoard.Web, :view

  def render("index.json", %{products: products}) do
    %{data: render_many(products, DragonHoard.ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, DragonHoard.ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      name: product.name,
      kind_of: product.kind_of,
    }
  end
end
