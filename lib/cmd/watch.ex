defmodule Cmd.Watch do
	@moduledoc """
  Listens on the NavNet discovery port and prints any messages received.

	Broadcast address: 172.31.255.255
	Port: 10010
	"""

  require Logger

#  @disco_addr {172,31,155,255}
  @disco_port 10010

	@doc "Starts the watch on all cells"
  def run do
    {:ok, _socket} = setup_socket()
    wait_msg()
  end

  defp setup_socket do
    {:ok, socket} = :gen_udp.open @disco_port,
      [ :binary,
        {:active, true},
        {:broadcast, true}
      ]
    IO.write "watching messages from NavNet\n"
    {:ok, socket}
  end

  defp wait_msg() do
  	receive do
      {:udp, _socket, ip, port, msg} ->
        Logger.info "#{__MODULE__} received from #{inspect ip} on port: #{port}"
        IO.write "#{inspect msg}"
        wait_msg()
      after
        5000 -> :ok
  	end
  end
end
