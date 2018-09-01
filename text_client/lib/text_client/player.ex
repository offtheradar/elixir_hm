defmodule TextClient.Player do

  alias TextClient.{Prompter, State, Summary, Mover}

  #won, lost, good_guess, bad guess, already used, initializing
  def play(game = %State{tally: %{ game_state: :won }}) do
    "You win"
    |> exit_with_message()
  end

  def play(game = %State{tally: %{ game_state: :lost }}) do
    "You lost!"
    |> exit_with_message()
  end

  def play(game = %State{tally: %{ game_state: :good_guess }}) do
    "Good guess!"
    |> continue_with_message(game)
  end

  def play(game = %State{tally: %{ game_state: :bad_guess }}) do
    "Bad guess"
    |> continue_with_message(game)
  end

  def play(game = %State{tally: %{ game_state: :already_used }}) do
    "Already used"
    |> continue_with_message(game)
  end

  def play(game) do
    continue(game)
  end

  def continue_with_message(message, game) do
    IO.puts(message)
    continue(game)
  end

  def continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end

  defp exit_with_message(msg) do
    msg
    |> IO.puts
    exit(:normal)
  end
end
