defmodule Hangman do

  alias Hangman.Game

  defdelegate tally(game),            to: Game
  defdelegate new_game(),             to: Game
  defdelegate make_move(game, guess), to: Game
  def make_move(game, guess) do
    game = Game.make_move(game, guess)
    {game, tally(game)}
  end

end
