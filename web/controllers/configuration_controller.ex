defmodule DragonHoard.ConfigurationController do
  use DragonHoard.Web, :controller

  alias DragonHoard.Configuration

  plug :scrub_params, "configuration" when action in [:create, :update]

  def index(conn, _params) do
    configurations = Repo.all(Configuration)
    render(conn, "index.json", configurations: configurations)
  end

  def create(conn, %{"configuration" => configuration_params}) do
    changeset = Configuration.changeset(%Configuration{}, configuration_params)

    case Repo.insert(changeset) do
      {:ok, configuration} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", configuration_path(conn, :show, configuration))
        |> render("show.json", configuration: configuration)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DragonHoard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    configuration = Repo.get!(Configuration, id)
    render(conn, "show.json", configuration: configuration)
  end

  def update(conn, %{"id" => id, "configuration" => configuration_params}) do
    configuration = Repo.get!(Configuration, id)
    changeset = Configuration.changeset(configuration, configuration_params)

    case Repo.update(changeset) do
      {:ok, configuration} ->
        render(conn, "show.json", configuration: configuration)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DragonHoard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    configuration = Repo.get!(Configuration, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(configuration)

    send_resp(conn, :no_content, "")
  end
end
