defmodule EncounterTest do
  use ExUnit.Case
  doctest Encounter

  test "greets the world" do
    assert Encounter.hello() == :world
  end
end
