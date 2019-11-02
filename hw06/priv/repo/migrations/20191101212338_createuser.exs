defmodule Hw06.Repo.Migrations.Createuser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :name, :string, null: false
      add :password_hash, :string, default: "", null: false
      add :ismanager, :boolean, default: false, null: true
      add :managerid, :integer, null: true

      timestamps()
    end

  end
end
