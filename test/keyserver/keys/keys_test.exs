defmodule Keyserver.KeysTest do
  use Keyserver.DataCase

  alias Keyserver.Keys

  describe "records" do
    alias Keyserver.Keys.Record

    @valid_attrs %{id: "7488a646-e31f-11e4-aace-600308960662", key: %{}}
    @update_attrs %{id: "7488a646-e31f-11e4-aace-600308960668", key: %{}}
    @invalid_attrs %{id: nil, key: nil}

    def record_fixture(attrs \\ %{}) do
      {:ok, record} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Keys.create_record()

      record
    end

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Keys.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Keys.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      assert {:ok, %Record{} = record} = Keys.create_record(@valid_attrs)
      assert record.id == "7488a646-e31f-11e4-aace-600308960662"
      assert record.key == %{}
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Keys.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      assert {:ok, record} = Keys.update_record(record, @update_attrs)
      assert %Record{} = record
      assert record.id == "7488a646-e31f-11e4-aace-600308960668"
      assert record.key == %{}
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Keys.update_record(record, @invalid_attrs)
      assert record == Keys.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Keys.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Keys.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Keys.change_record(record)
    end
  end
end
