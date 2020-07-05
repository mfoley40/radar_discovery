defmodule Cmd.Discover do
  @moduledoc """
  Tries to discover Furuno radars on the NavNet network.
  """
  require Logger

  @disco_addr {172,31,155,255}
  @disco_port 10010

  @doc "Takes paramater(s) from Cmd.main to perform action"
  def run() do
    Logger.info("#{__MODULE__} run")

    # May want to look at spawnin receiver thread
    #pid = spawn(&recv/0)
    #send(pid, :message1)

    {:ok, socket} = :gen_udp.open @disco_port,
      [ :binary,
        {:active, true},
        {:broadcast, true}
      ]
    send_discover_msg socket
    wait_msg()
  end

  def handle_info({:udp, _socket, {172, 31, x, y}, _port, msg}, state) do
    Logger.info "#{__MODULE__} handle_info"
    Logger.info "#{__MODULE__} state = #{inspect state}"
    Logger.info "#{__MODULE__} from = #{x}.#{y}"
    Logger.info "#{inspect msg}"
    {:noreply, state}
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

  defp send_discover_msg(socket) do
    :gen_udp.send socket, @disco_addr, @disco_port, discover_msg()
  end

  # 01 00 00 01 00 00 00 00 01 01 00 08 01 00 00 00
  defp discover_msg do
    <<01, 00, 00, 01, 00, 00, 00, 00, 01, 01, 00, 08, 01, 00, 00, 00>>
  end
end
