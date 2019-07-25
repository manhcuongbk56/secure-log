defmodule ProxyLogger do
  import IO, only: [puts: 1]
  @behaviour :gen_event

  def init(:proxy) do
    puts "INIT BY MY FUNCTION"
  {:ok, :ok}
  end

  def init({__MODULE__, name}) do
    puts "INIT BY MR.LINH's FUNCTION"


    {:ok, %{}}
  end

  def handle_event({level, gl, {Logger, msg, _, _}}, state) do
    puts "Log from proxy logger"
    puts msg
  end

  def handle_call(request, state) do
    puts "Handle Call from my proxy logger"
    :ok
  end


  def handle_info({:io_reply, ref, msg}, %{ref: ref} = state) do
    puts "Log from proxy logger"
    {:ok, "ok"}
  end

  def terminate() do

  end

end