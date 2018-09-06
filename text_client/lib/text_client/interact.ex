defmodule TextClient.Interact do

  @hangman_server :hangman@e1z4r14p10
  alias TextClient.{State, Player}

  def start() do
    new_game()
    |> setup_state()
    |> Player.play()
  end

  defp setup_state(pid) do
    %State{
      game_service: pid,
      tally:        Hangman.tally(pid),
    }
  end

  defp new_game() do
    Node.connect(@hangman_server)
    :rpc.call(@hangman_server,
              Hangman,
              :new_game,
              [])
  end
end
