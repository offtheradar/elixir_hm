defmodule Procs do
  def hello(count) do
    receive do
      { :boom, reason} ->
        exit(reason)
      { :add, n } ->
          hello(count + n)
      { :reset} ->
          hello(0)
      msg ->
        IO.puts "#{count}: Hello #{inspect msg}"
        hello(count+2)
    end
  end
end
