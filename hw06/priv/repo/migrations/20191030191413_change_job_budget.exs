defmodule Hw06.Repo.Migrations.ChangeJobBudget do
  use Ecto.Migration

  def change do
    alter table("jobs") do
      modify :budget, :decimal, default: 0, null: false
    end
  end
end
