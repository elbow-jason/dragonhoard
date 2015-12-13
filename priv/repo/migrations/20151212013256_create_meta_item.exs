defmodule DragonHoard.Repo.Migrations.CreateMetaItem do
  use Ecto.Migration

  def change do
    create table(:meta_items) do
      add :name, :string
      add :kind_of, :string

      timestamps
    end

  end
end
