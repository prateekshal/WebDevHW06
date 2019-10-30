defmodule Hw06.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :jobid, :string
      add :desc, :string

      timestamps()
    end

  end
end
