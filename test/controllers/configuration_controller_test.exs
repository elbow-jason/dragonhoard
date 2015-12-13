defmodule DragonHoard.ConfigurationControllerTest do
  use DragonHoard.ConnCase

  alias DragonHoard.Configuration
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, configuration_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    configuration = Repo.insert! %Configuration{}
    conn = get conn, configuration_path(conn, :show, configuration)
    assert json_response(conn, 200)["data"] == %{"id" => configuration.id,
      "name" => configuration.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, configuration_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, configuration_path(conn, :create), configuration: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Configuration, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, configuration_path(conn, :create), configuration: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    configuration = Repo.insert! %Configuration{}
    conn = put conn, configuration_path(conn, :update, configuration), configuration: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Configuration, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    configuration = Repo.insert! %Configuration{}
    conn = put conn, configuration_path(conn, :update, configuration), configuration: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    configuration = Repo.insert! %Configuration{}
    conn = delete conn, configuration_path(conn, :delete, configuration)
    assert response(conn, 204)
    refute Repo.get(Configuration, configuration.id)
  end
end
