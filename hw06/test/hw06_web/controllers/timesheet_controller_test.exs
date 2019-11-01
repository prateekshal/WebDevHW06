defmodule Hw06Web.TimesheetControllerTest do
  use Hw06Web.ConnCase

  alias Hw06.Timesheets

  @create_attrs %{date: ~D[2010-04-17], hr1: "120.5", hr2: "120.5", hr3: "120.5", hr4: "120.5", hr5: "120.5", hr6: "120.5", hr7: "120.5", hr8: "120.5", jobid1: "some jobid1", jobid2: "some jobid2", jobid3: "some jobid3", jobid4: "some jobid4", jobid5: "some jobid5", jobid6: "some jobid6", jobid7: "some jobid7", jobid8: "some jobid8", status: "some status"}
  @update_attrs %{date: ~D[2011-05-18], hr1: "456.7", hr2: "456.7", hr3: "456.7", hr4: "456.7", hr5: "456.7", hr6: "456.7", hr7: "456.7", hr8: "456.7", jobid1: "some updated jobid1", jobid2: "some updated jobid2", jobid3: "some updated jobid3", jobid4: "some updated jobid4", jobid5: "some updated jobid5", jobid6: "some updated jobid6", jobid7: "some updated jobid7", jobid8: "some updated jobid8", status: "some updated status"}
  @invalid_attrs %{date: nil, hr1: nil, hr2: nil, hr3: nil, hr4: nil, hr5: nil, hr6: nil, hr7: nil, hr8: nil, jobid1: nil, jobid2: nil, jobid3: nil, jobid4: nil, jobid5: nil, jobid6: nil, jobid7: nil, jobid8: nil, status: nil}

  def fixture(:timesheet) do
    {:ok, timesheet} = Timesheets.create_timesheet(@create_attrs)
    timesheet
  end

  describe "index" do
    test "lists all timesheets", %{conn: conn} do
      conn = get(conn, Routes.timesheet_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Timesheets"
    end
  end

  describe "new timesheet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.timesheet_path(conn, :new))
      assert html_response(conn, 200) =~ "New Timesheet"
    end
  end

  describe "create timesheet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.timesheet_path(conn, :create), timesheet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.timesheet_path(conn, :show, id)

      conn = get(conn, Routes.timesheet_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Timesheet"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.timesheet_path(conn, :create), timesheet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Timesheet"
    end
  end

  describe "edit timesheet" do
    setup [:create_timesheet]

    test "renders form for editing chosen timesheet", %{conn: conn, timesheet: timesheet} do
      conn = get(conn, Routes.timesheet_path(conn, :edit, timesheet))
      assert html_response(conn, 200) =~ "Edit Timesheet"
    end
  end

  describe "update timesheet" do
    setup [:create_timesheet]

    test "redirects when data is valid", %{conn: conn, timesheet: timesheet} do
      conn = put(conn, Routes.timesheet_path(conn, :update, timesheet), timesheet: @update_attrs)
      assert redirected_to(conn) == Routes.timesheet_path(conn, :show, timesheet)

      conn = get(conn, Routes.timesheet_path(conn, :show, timesheet))
      assert html_response(conn, 200) =~ "some updated jobid1"
    end

    test "renders errors when data is invalid", %{conn: conn, timesheet: timesheet} do
      conn = put(conn, Routes.timesheet_path(conn, :update, timesheet), timesheet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Timesheet"
    end
  end

  describe "delete timesheet" do
    setup [:create_timesheet]

    test "deletes chosen timesheet", %{conn: conn, timesheet: timesheet} do
      conn = delete(conn, Routes.timesheet_path(conn, :delete, timesheet))
      assert redirected_to(conn) == Routes.timesheet_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.timesheet_path(conn, :show, timesheet))
      end
    end
  end

  defp create_timesheet(_) do
    timesheet = fixture(:timesheet)
    {:ok, timesheet: timesheet}
  end
end
