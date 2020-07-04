defmodule Cmd.Discover do
  @moduledoc """
  Tries to discover Furuno radars on the NavNet network.
  """
  require Logger

  @doc "Takes paramater(s) from Cmd.main to perform action"
  def run(_spec, _opts \\ %{}) do
    Logger.info("#{__MODULE__} run")
  end
end
