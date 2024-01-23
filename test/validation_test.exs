defmodule ValidationTest do
  use ExUnit.Case
  alias Mastery.Boundary.QuizValidator

  test "quiz fields with only a title are valid" do
    assert QuizValidator.errors(%{title: "title"}) == :ok
  end

  test "quiz fields without a title are not valid" do
    assert QuizValidator.errors(%{}) == [title: "is required"]
  end

  test "quiz fields without a title and a bad mastery are not valid" do
    expected = [title: "is required", mastery: "must be greater than zero"]
    assert QuizValidator.errors(%{mastery: 0}) == expected
  end

  test "quiz fields of the wrong type are not valid" do
    expected = [nil: "A map of fields is required"]
    assert QuizValidator.errors("invalid") == expected
  end
end
