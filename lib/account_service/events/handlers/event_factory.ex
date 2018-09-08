defmodule AccountService.Events.Handlers.EventFactory do
  @behaviour AccountService.Events.Handlers.Handler

  alias AccountService.Events.Event
  alias AccountService.Events.Handlers.{OrderEventHandler}

  @doc """
  Pattern matches on a tuple and calls the appropriate handle for the event type.

  ## Examples

      iex> call({"order.accepted", event})
      {:ok, %Event{}}
  """
  def call({"order.accepted", event}) do
    OrderEventHandler.call(event)
  end
  def call({_, event}), do: {:ok, nil}

end
