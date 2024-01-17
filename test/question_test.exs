defmodule QuestionTest do
  use ExUnit.Case
  use QuizBuilders

  def eventually_match(generators, answer) do
    Stream.repeatedly(fn ->
      build_question(generators: generators).substitutions
    end)
    |> Enum.find(fn substitutions ->
      Keyword.fetch!(substitutions, :left) == answer
    end)
  end
end
