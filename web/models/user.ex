defmodule DragonHoard.User do
  use DragonHoard.Web, :model

  alias DragonHoard.Password
  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :email,     :string
    field :password,  :string, virtual: true

    field :roles, {:array, :string}
    field :pw_hash, :string

    timestamps
  end

  @required_fields ~w(email password)
  @optional_fields ~w(roles)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def hash_password(%User{password: password} = user) do
    user |> Map.put(:pw_hash, Password.hash_password(password))
  end

  def password_is_correct?(%User{pw_hash: pw_hash}, attempted_password) do
    Password.password_matches?(attempted_password, pw_hash)
  end
end
