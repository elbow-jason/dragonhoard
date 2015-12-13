defmodule DragonHoard.MetaItemControllerTest do
  use DragonHoard.ConnCase

  alias DragonHoard.MetaItem
  @valid_attrs %{kind_of: "some content", name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, meta_item_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    meta_item = Repo.insert! %MetaItem{}
    conn = get conn, meta_item_path(conn, :show, meta_item)
    assert json_response(conn, 200)["data"] == %{"id" => meta_item.id,
      "name" => meta_item.name,
      "kind_of" => meta_item.kind_of}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, meta_item_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, meta_item_path(conn, :create), meta_item: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(MetaItem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, meta_item_path(conn, :create), meta_item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    meta_item = Repo.insert! %MetaItem{}
    conn = put conn, meta_item_path(conn, :update, meta_item), meta_item: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(MetaItem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    meta_item = Repo.insert! %MetaItem{}
    conn = put conn, meta_item_path(conn, :update, meta_item), meta_item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    meta_item = Repo.insert! %MetaItem{}
    conn = delete conn, meta_item_path(conn, :delete, meta_item)
    assert response(conn, 204)
    refute Repo.get(MetaItem, meta_item.id)
  end
end
