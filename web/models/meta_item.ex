defmodule DragonHoard.MetaItem do
  use DragonHoard.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "meta_items" do
    field :name, :string
    field :kind_of, :string

    timestamps
  end

  @required_fields ~w(name kind_of)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
