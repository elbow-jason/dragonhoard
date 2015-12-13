defmodule DragonHoard.MetaItemController do
  use DragonHoard.Web, :controller

  alias DragonHoard.MetaItem

  plug :scrub_params, "meta_item" when action in [:create, :update]

  def index(conn, _params) do
    meta_items = Repo.all(MetaItem)
    render(conn, "index.json", meta_items: meta_items)
  end

  def create(conn, %{"meta_item" => meta_item_params}) do
    changeset = MetaItem.changeset(%MetaItem{}, meta_item_params)

    case Repo.insert(changeset) do
      {:ok, meta_item} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", meta_item_path(conn, :show, meta_item))
        |> render("show.json", meta_item: meta_item)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DragonHoard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    meta_item = Repo.get!(MetaItem, id)
    render(conn, "show.json", meta_item: meta_item)
  end

  def update(conn, %{"id" => id, "meta_item" => meta_item_params}) do
    meta_item = Repo.get!(MetaItem, id)
    changeset = MetaItem.changeset(meta_item, meta_item_params)

    case Repo.update(changeset) do
      {:ok, meta_item} ->
        render(conn, "show.json", meta_item: meta_item)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DragonHoard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    meta_item = Repo.get!(MetaItem, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(meta_item)

    send_resp(conn, :no_content, "")
  end
end
