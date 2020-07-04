defmodule Cmd.Help do
  @moduledoc """
  Provides help and usage of the radar tool
  """

  @help """

  radar - search for Furuno radars on Navnet. Print any found.

  radar discover                find radars using NavNet discovery
  radar help                    shows this help message

  """

  @doc """
  Prints out help information using IO.write
  """
  def run, do: IO.write(@help)
end
