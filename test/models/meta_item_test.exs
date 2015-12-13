defmodule DragonHoard.MetaItemTest do
  use DragonHoard.ModelCase

  alias DragonHoard.MetaItem

  @valid_attrs %{kind_of: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MetaItem.changeset(%MetaItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MetaItem.changeset(%MetaItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
