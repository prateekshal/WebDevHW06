defmodule Hw06.TimesheetsTest do
  use Hw06.DataCase

  alias Hw06.Timesheets

  describe "timesheets" do
    alias Hw06.Timesheets.Timesheet

    @valid_attrs %{date: ~D[2010-04-17], hr1: "120.5", hr2: "120.5", hr3: "120.5", hr4: "120.5", hr5: "120.5", hr6: "120.5", hr7: "120.5", hr8: "120.5", status: "some status"}
    @update_attrs %{date: ~D[2011-05-18], hr1: "456.7", hr2: "456.7", hr3: "456.7", hr4: "456.7", hr5: "456.7", hr6: "456.7", hr7: "456.7", hr8: "456.7", status: "some updated status"}
    @invalid_attrs %{date: nil, hr1: nil, hr2: nil, hr3: nil, hr4: nil, hr5: nil, hr6: nil, hr7: nil, hr8: nil, status: nil}

    def timesheet_fixture(attrs \\ %{}) do
      {:ok, timesheet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Timesheets.create_timesheet()

      timesheet
    end

    test "list_timesheets/0 returns all timesheets" do
      timesheet = timesheet_fixture()
      assert Timesheets.list_timesheets() == [timesheet]
    end

    test "get_timesheet!/1 returns the timesheet with given id" do
      timesheet = timesheet_fixture()
      assert Timesheets.get_timesheet!(timesheet.id) == timesheet
    end

    test "create_timesheet/1 with valid data creates a timesheet" do
      assert {:ok, %Timesheet{} = timesheet} = Timesheets.create_timesheet(@valid_attrs)
      assert timesheet.date == ~D[2010-04-17]
      assert timesheet.hr1 == Decimal.new("120.5")
      assert timesheet.hr2 == Decimal.new("120.5")
      assert timesheet.hr3 == Decimal.new("120.5")
      assert timesheet.hr4 == Decimal.new("120.5")
      assert timesheet.hr5 == Decimal.new("120.5")
      assert timesheet.hr6 == Decimal.new("120.5")
      assert timesheet.hr7 == Decimal.new("120.5")
      assert timesheet.hr8 == Decimal.new("120.5")
      assert timesheet.status == "some status"
    end

    test "create_timesheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timesheets.create_timesheet(@invalid_attrs)
    end

    test "update_timesheet/2 with valid data updates the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{} = timesheet} = Timesheets.update_timesheet(timesheet, @update_attrs)
      assert timesheet.date == ~D[2011-05-18]
      assert timesheet.hr1 == Decimal.new("456.7")
      assert timesheet.hr2 == Decimal.new("456.7")
      assert timesheet.hr3 == Decimal.new("456.7")
      assert timesheet.hr4 == Decimal.new("456.7")
      assert timesheet.hr5 == Decimal.new("456.7")
      assert timesheet.hr6 == Decimal.new("456.7")
      assert timesheet.hr7 == Decimal.new("456.7")
      assert timesheet.hr8 == Decimal.new("456.7")
      assert timesheet.status == "some updated status"
    end

    test "update_timesheet/2 with invalid data returns error changeset" do
      timesheet = timesheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Timesheets.update_timesheet(timesheet, @invalid_attrs)
      assert timesheet == Timesheets.get_timesheet!(timesheet.id)
    end

    test "delete_timesheet/1 deletes the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{}} = Timesheets.delete_timesheet(timesheet)
      assert_raise Ecto.NoResultsError, fn -> Timesheets.get_timesheet!(timesheet.id) end
    end

    test "change_timesheet/1 returns a timesheet changeset" do
      timesheet = timesheet_fixture()
      assert %Ecto.Changeset{} = Timesheets.change_timesheet(timesheet)
    end
  end

  describe "timesheets" do
    alias Hw06.Timesheets.Timesheet

    @valid_attrs %{date: ~D[2010-04-17], hr1: "120.5", hr2: "120.5", hr3: "120.5", hr4: "120.5", hr5: "120.5", hr6: "120.5", hr7: "120.5", hr8: "120.5", jobid1: "some jobid1", jobid2: "some jobid2", jobid3: "some jobid3", jobid4: "some jobid4", jobid5: "some jobid5", jobid6: "some jobid6", jobid7: "some jobid7", jobid8: "some jobid8", status: "some status"}
    @update_attrs %{date: ~D[2011-05-18], hr1: "456.7", hr2: "456.7", hr3: "456.7", hr4: "456.7", hr5: "456.7", hr6: "456.7", hr7: "456.7", hr8: "456.7", jobid1: "some updated jobid1", jobid2: "some updated jobid2", jobid3: "some updated jobid3", jobid4: "some updated jobid4", jobid5: "some updated jobid5", jobid6: "some updated jobid6", jobid7: "some updated jobid7", jobid8: "some updated jobid8", status: "some updated status"}
    @invalid_attrs %{date: nil, hr1: nil, hr2: nil, hr3: nil, hr4: nil, hr5: nil, hr6: nil, hr7: nil, hr8: nil, jobid1: nil, jobid2: nil, jobid3: nil, jobid4: nil, jobid5: nil, jobid6: nil, jobid7: nil, jobid8: nil, status: nil}

    def timesheet_fixture(attrs \\ %{}) do
      {:ok, timesheet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Timesheets.create_timesheet()

      timesheet
    end

    test "list_timesheets/0 returns all timesheets" do
      timesheet = timesheet_fixture()
      assert Timesheets.list_timesheets() == [timesheet]
    end

    test "get_timesheet!/1 returns the timesheet with given id" do
      timesheet = timesheet_fixture()
      assert Timesheets.get_timesheet!(timesheet.id) == timesheet
    end

    test "create_timesheet/1 with valid data creates a timesheet" do
      assert {:ok, %Timesheet{} = timesheet} = Timesheets.create_timesheet(@valid_attrs)
      assert timesheet.date == ~D[2010-04-17]
      assert timesheet.hr1 == Decimal.new("120.5")
      assert timesheet.hr2 == Decimal.new("120.5")
      assert timesheet.hr3 == Decimal.new("120.5")
      assert timesheet.hr4 == Decimal.new("120.5")
      assert timesheet.hr5 == Decimal.new("120.5")
      assert timesheet.hr6 == Decimal.new("120.5")
      assert timesheet.hr7 == Decimal.new("120.5")
      assert timesheet.hr8 == Decimal.new("120.5")
      assert timesheet.jobid1 == "some jobid1"
      assert timesheet.jobid2 == "some jobid2"
      assert timesheet.jobid3 == "some jobid3"
      assert timesheet.jobid4 == "some jobid4"
      assert timesheet.jobid5 == "some jobid5"
      assert timesheet.jobid6 == "some jobid6"
      assert timesheet.jobid7 == "some jobid7"
      assert timesheet.jobid8 == "some jobid8"
      assert timesheet.status == "some status"
    end

    test "create_timesheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timesheets.create_timesheet(@invalid_attrs)
    end

    test "update_timesheet/2 with valid data updates the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{} = timesheet} = Timesheets.update_timesheet(timesheet, @update_attrs)
      assert timesheet.date == ~D[2011-05-18]
      assert timesheet.hr1 == Decimal.new("456.7")
      assert timesheet.hr2 == Decimal.new("456.7")
      assert timesheet.hr3 == Decimal.new("456.7")
      assert timesheet.hr4 == Decimal.new("456.7")
      assert timesheet.hr5 == Decimal.new("456.7")
      assert timesheet.hr6 == Decimal.new("456.7")
      assert timesheet.hr7 == Decimal.new("456.7")
      assert timesheet.hr8 == Decimal.new("456.7")
      assert timesheet.jobid1 == "some updated jobid1"
      assert timesheet.jobid2 == "some updated jobid2"
      assert timesheet.jobid3 == "some updated jobid3"
      assert timesheet.jobid4 == "some updated jobid4"
      assert timesheet.jobid5 == "some updated jobid5"
      assert timesheet.jobid6 == "some updated jobid6"
      assert timesheet.jobid7 == "some updated jobid7"
      assert timesheet.jobid8 == "some updated jobid8"
      assert timesheet.status == "some updated status"
    end

    test "update_timesheet/2 with invalid data returns error changeset" do
      timesheet = timesheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Timesheets.update_timesheet(timesheet, @invalid_attrs)
      assert timesheet == Timesheets.get_timesheet!(timesheet.id)
    end

    test "delete_timesheet/1 deletes the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{}} = Timesheets.delete_timesheet(timesheet)
      assert_raise Ecto.NoResultsError, fn -> Timesheets.get_timesheet!(timesheet.id) end
    end

    test "change_timesheet/1 returns a timesheet changeset" do
      timesheet = timesheet_fixture()
      assert %Ecto.Changeset{} = Timesheets.change_timesheet(timesheet)
    end
  end
end
