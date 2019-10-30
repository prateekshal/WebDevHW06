defmodule Hw06.Repo.Migrations.AddJobDetails do
  use Ecto.Migration

  def change do
    alter table("jobs") do
      add :budget, :decimal, default: 0, null: false
      add :name, :string, default: "", null: false
    end
  end
end
