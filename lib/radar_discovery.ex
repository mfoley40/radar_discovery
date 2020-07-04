defmodule RadarDiscovery do
  @moduledoc """
  Entry point for the application `radar`.
  """

  require Logger

  @doc """
  Function that gets call when run as CLI
  """
  def main(args) do
    Logger.info("#{__MODULE__} starting in main args: #{inspect(args)}")
    args |> parse_args
  end

  #
  # Parses the argument list and calls the appropirate module
  #
  defp parse_args(args) do
    options =
      OptionParser.parse(args,
        strict: [help: :boolean, discover: :boolean],
        aliases: aliases()
      )

    Logger.info("options: #{inspect(options)}")

    case options do
      #
      # Discover
      #
      {[discover: true], _, _} ->
        Cmd.Discover.run(nil)

      {[], ["discover"], []} ->
        Cmd.Discover.run(nil)

      #
      # Help
      #
      {_, ["help"], _} ->
        Cmd.Help.run()

      {[help: true], _, _} ->
        Cmd.Help.run()

      #
      # Default
      #
      _ ->
        IO.write("\n\nInvalid usage or malformed command\n\nUsage:\n\n")
        Cmd.Help.run()
    end
  end

  #
  # Definition of aliases to be used with OptionParser
  #
  defp aliases,
    do: [
      h: :help,
      d: :discover
    ]
end
