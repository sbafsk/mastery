defmodule ResponseTest do
  use ExUnit.Case
  use QuizBuilders

  describe "a right response and a wrong response" do
    setup [:right, :wrong]

    test "building responses check answers", %{right: right, wrong: wrong} do
      assert right.correct
      refute wrong.correct
    end
  end

  defp quiz() do
    fields = template_fields(generators: %{left: [1], right: [2]})

    build_quiz()
    |> Quiz.add_template(fields)
    |> Quiz.select_question()
  end

  defp response(answer) do
    Response.new(quiz(), "test@example.com", answer)
  end

  defp right(context) do
    {:ok, Map.put(context, :right, response("3"))}
  end

  defp wrong(context) do
    {:ok, Map.put(context, :wrong, response("2"))}
  end
end
