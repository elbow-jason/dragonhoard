defmodule DragonHoard.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email,       :string
      add :first_name,  :string
      add :lasst_name,  :string
      add :roles, {:array, :string}
      add :pw_hash, :string

      timestamps
    end
    create index(:users, [:email], unique: true)
  end
end
