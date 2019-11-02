defmodule Hw06.Timesheets do
  @moduledoc """
  The Timesheets context.
  """

  import Ecto.Query, warn: false
  alias Hw06.Repo

  alias Hw06.Timesheets.Timesheet

  @doc """
  Returns the list of timesheets.

  ## Examples

      iex> list_timesheets()
      [%Timesheet{}, ...]

  """
  def list_timesheets(id) do
    query = from(t in Timesheet, where: t.user_id == ^id, select: t)
    Repo.all(query)
  end

  @doc """
  Gets a single timesheet.

  Raises `Ecto.NoResultsError` if the Timesheet does not exist.

  ## Examples

      iex> get_timesheet!(123)
      %Timesheet{}

      iex> get_timesheet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_timesheet!(id) do
    Repo.one! from t in Timesheet,
      where: t.id == ^id,
      preload: [:user]
  end

  def approve(id) do
    
  end

  def getworkers(id) do
    query = from(u in Hw06.Users.User, where: u.managerid == ^id, select: u.id)
    Repo.all(query)
  end

  def get_timesheets(workers) do
    query = from(t in Timesheet, where: t.user_id in ^workers, select: t)
    Repo.all(query)
  end

  @doc """
  Creates a timesheet.

  ## Examples

      iex> create_timesheet(%{field: value})
      {:ok, %Timesheet{}}

      iex> create_timesheet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_timesheet(attrs \\ %{}) do


    attrs = if attrs["hr1"] == "" do
      Map.put(attrs, "hr1", 0)
      Map.put(attrs, "jobid1", "")
     else
      attrs
    end
    attrs = if attrs["hr2"] == "" do
              Map.put(attrs, "hr2", 0)
              Map.put(attrs, "jobid2", "")
            else
              attrs
            end
    attrs = if attrs["hr3"] == "" do
              Map.put(attrs, "hr3", 0)
              Map.put(attrs, "jobid3", "")
            else
              attrs
            end
    attrs = if attrs["hr4"] == "" do
              Map.put(attrs, "hr4", 0)
              Map.put(attrs, "jobid4", "")
            else
              attrs
            end
    attrs = if attrs["hr5"] == "" do
              Map.put(attrs, "hr5", 0)
              Map.put(attrs, "jobid5", "")
            else
              attrs
            end
    attrs = if attrs["hr6"] == "" do
              Map.put(attrs, "hr6", 0)
              Map.put(attrs, "jobid6", "")
            else
              attrs
            end
    attrs = if attrs["hr7"] == "" do
              Map.put(attrs, "hr7", 0)
              Map.put(attrs, "jobid7", "")
            else
              attrs
            end
    attrs = if attrs["hr8"] == "" do
              Map.put(attrs, "hr8", 0)
              Map.put(attrs, "jobid8", "")
            else
              attrs
            end

    {a, ""} = if attrs["hr1"] != "" do
              Float.parse(attrs["hr1"])
            else
              {0, ""}
            end
    {b, ""} = if attrs["hr2"] != "" do
              Float.parse(attrs["hr2"])
            else
              {0, ""}
            end
    {c, ""} = if attrs["hr3"] != "" do
              Float.parse(attrs["hr3"])
            else
              {0, ""}
            end
    {d, ""} = if attrs["hr4"] != "" do
              Float.parse(attrs["hr4"])
            else
              {0, ""}
            end
    {e, ""} = if attrs["hr5"] != "" do
              Float.parse(attrs["hr5"])
            else
              {0, ""}
            end
    {f, ""} = if attrs["hr6"] != "" do
              Float.parse(attrs["hr6"])
            else
              {0, ""}
            end
    {g, ""} = if attrs["hr7"] != "" do
              Float.parse(attrs["hr7"])
            else
              {0, ""}
            end
    {h, ""} = if attrs["hr8"] != "" do
              Float.parse(attrs["hr8"])
            else
              {0, ""}
            end
    total = a + b + c + d + e + f + g + h


    %Timesheet{}
    |> Timesheet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a timesheet.

  ## Examples

      iex> update_timesheet(timesheet, %{field: new_value})
      {:ok, %Timesheet{}}

      iex> update_timesheet(timesheet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_timesheet(%Timesheet{} = timesheet, attrs) do
    timesheet
    |> Timesheet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Timesheet.

  ## Examples

      iex> delete_timesheet(timesheet)
      {:ok, %Timesheet{}}

      iex> delete_timesheet(timesheet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_timesheet(%Timesheet{} = timesheet) do
    Repo.delete(timesheet)
  end

  def getjobs() do
    query = from(j in Hw06.Jobs.Job, select: j.jobid)
    Repo.all(query)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking timesheet changes.

  ## Examples

      iex> change_timesheet(timesheet)
      %Ecto.Changeset{source: %Timesheet{}}

  """
  def change_timesheet(%Timesheet{} = timesheet) do
    Timesheet.changeset(timesheet, %{})
  end
end
