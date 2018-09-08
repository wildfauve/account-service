defmodule AccountService.Events.Handlers.Handler do
  @callback call(event :: term) :: {:ok, term} | {:error, term}
end