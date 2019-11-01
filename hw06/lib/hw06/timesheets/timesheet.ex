defmodule Hw06.Timesheets.Timesheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timesheets" do
    field :date, :date
    field :hr1, :decimal
    field :hr2, :decimal
    field :hr3, :decimal
    field :hr4, :decimal
    field :hr5, :decimal
    field :hr6, :decimal
    field :hr7, :decimal
    field :hr8, :decimal
    field :jobid1, :string
    field :jobid2, :string
    field :jobid3, :string
    field :jobid4, :string
    field :jobid5, :string
    field :jobid6, :string
    field :jobid7, :string
    field :jobid8, :string
    field :status, :string
    field :total, :decimal
    belongs_to :user, Hw06.Users.User

    timestamps()
  end

  @doc false
  def changeset(timesheet, attrs) do
    timesheet
    |> cast(attrs, [:date, :status, :jobid1, :hr1, :jobid2, :hr2, :jobid3, :hr3, :jobid4, :hr4, :jobid5, :hr5, :jobid6, :hr6, :jobid7, :hr7, :jobid8, :hr8, :total, :user_id])
    |> validate_required([:date, :user_id])
    |> validate_inclusion(:total, 0..8)
  end
end
