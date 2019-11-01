defmodule Hw06.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :jobid, :string
      add :desc, :string
      add :budget, :decimal, default: 0, null: false
      add :name, :string, default: "", null: false

      timestamps()
    end

  end
end
