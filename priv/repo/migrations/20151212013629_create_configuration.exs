defmodule DragonHoard.Repo.Migrations.CreateConfiguration do
  use Ecto.Migration

  def change do
    create table(:configurations) do
      add :name, :string

      timestamps
    end

  end
end
