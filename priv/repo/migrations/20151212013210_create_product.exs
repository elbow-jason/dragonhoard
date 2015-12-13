defmodule DragonHoard.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :kind_of, :string

      timestamps
    end

  end
end
