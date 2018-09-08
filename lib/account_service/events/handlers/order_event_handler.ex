defmodule AccountService.Events.Handlers.OrderEventHandler do
  @behaviour AccountService.Events.Handlers.Handler

  alias AccountService.Events.{Event}

  def call(event) do
    with {:ok, event_repo} <- Event.create_event(event) do

    end
    require IEx
    IEx.pry()
  end

end
