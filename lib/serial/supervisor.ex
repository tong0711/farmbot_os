defmodule Farmbot.Serial.Supervisor do
  @moduledoc false
  use Supervisor
  require Logger

  def init([]) do
    children = [worker(Farmbot.Serial.Handler, [], restart: :permanent)]
    supervise(children, strategy: :one_for_one)
  end

  @doc """
    Start the serial supervisor
  """
  def start_link do
    Logger.info(">> is starting serial services")
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end
end
