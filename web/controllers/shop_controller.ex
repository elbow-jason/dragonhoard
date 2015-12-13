defmodule DragonHoard.ShopController do
  use DragonHoard.Web, :controller

  alias DragonHoard.Shop

  plug :scrub_params, "shop" when action in [:create, :update]

  def index(conn, _params) do
    shops = Repo.all(Shop)
    render(conn, "index.json", shops: shops)
  end

  def create(conn, %{"shop" => shop_params}) do
    changeset = Shop.changeset(%Shop{}, shop_params)

    case Repo.insert(changeset) do
      {:ok, shop} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", shop_path(conn, :show, shop))
        |> render("show.json", shop: shop)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DragonHoard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    shop = Repo.get!(Shop, id)
    render(conn, "show.json", shop: shop)
  end

  def update(conn, %{"id" => id, "shop" => shop_params}) do
    shop = Repo.get!(Shop, id)
    changeset = Shop.changeset(shop, shop_params)

    case Repo.update(changeset) do
      {:ok, shop} ->
        render(conn, "show.json", shop: shop)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DragonHoard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shop = Repo.get!(Shop, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(shop)

    send_resp(conn, :no_content, "")
  end
end
