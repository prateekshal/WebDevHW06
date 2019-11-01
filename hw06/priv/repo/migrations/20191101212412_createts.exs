defmodule Hw06.Repo.Migrations.Createts do
  use Ecto.Migration

  def change do
    create table(:timesheets) do
      add :date, :date, null: false
      add :status, :string, null: true
      add :jobid1, :string, null: true
      add :hr1, :decimal, null: true
      add :jobid2, :string, null: true
      add :hr2, :decimal, null: true
      add :jobid3, :string, null: true
      add :hr3, :decimal, null: true
      add :jobid4, :string, null: true
      add :hr4, :decimal, null: true
      add :jobid5, :string, null: true
      add :hr5, :decimal, null: true
      add :jobid6, :string, null: true
      add :hr6, :decimal, null: true
      add :jobid7, :string, null: true
      add :hr7, :decimal, null: true
      add :jobid8, :string, null: true
      add :hr8, :decimal, null: true
      add :total, :decimal, null: true
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:timesheets, [:user_id])
  end
end
