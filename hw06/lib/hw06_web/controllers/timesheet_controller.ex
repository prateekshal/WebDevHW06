defmodule Hw06Web.TimesheetController do
  use Hw06Web, :controller

  alias Hw06.Timesheets
  alias Hw06.Timesheets.Timesheet

  def index(conn, _params) do
    user = conn.assigns[:current_user].id
    timesheets = Timesheets.list_timesheets(user)
    render(conn, "index.html", timesheets: timesheets)
  end

  def new(conn, _params) do
    IO.puts("New function")
    jobs = Timesheets.getjobs()
    changeset = Timesheets.change_timesheet(%Timesheet{})
    render(conn, "new.html", changeset: changeset, jobs: jobs)
  end

  def create(conn, %{"timesheet" => timesheet_params}) do
    timesheet_params = Map.put(timesheet_params, "user_id", conn.assigns[:current_user].id)
    timesheet_params = Map.put(timesheet_params, "status", "Pending")
    
    case Timesheets.create_timesheet(timesheet_params) do
      {:ok, timesheet} ->
        conn
        |> put_flash(:info, "Timesheet created successfully.")
        |> redirect(to: Routes.timesheet_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    timesheet = Timesheets.get_timesheet!(id)
    render(conn, "show.html", timesheet: timesheet)
  end

  def edit(conn, %{"id" => id}) do
    timesheet = Timesheets.get_timesheet!(id)
    changeset = Timesheets.change_timesheet(timesheet)
    render(conn, "edit.html", timesheet: timesheet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "timesheet" => timesheet_params}) do
    timesheet = Timesheets.get_timesheet!(id)

    case Timesheets.update_timesheet(timesheet, timesheet_params) do
      {:ok, timesheet} ->
        conn
        |> put_flash(:info, "Timesheet updated successfully.")
        |> redirect(to: Routes.timesheet_path(conn, :show, timesheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", timesheet: timesheet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    timesheet = Timesheets.get_timesheet!(id)
    {:ok, _timesheet} = Timesheets.delete_timesheet(timesheet)

    conn
    |> put_flash(:info, "Timesheet deleted successfully.")
    |> redirect(to: Routes.timesheet_path(conn, :index))
  end
end
