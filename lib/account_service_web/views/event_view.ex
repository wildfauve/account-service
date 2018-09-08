defmodule AccountServiceWeb.EventView do
  use AccountServiceWeb, :view
  alias AccountServiceWeb.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    render_one(event, EventView, "event.json")
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      event_id: event.event_id,
      event_type: event.event_type,
      state: event.state,
      event: event.event,
      audit: event.audit}
  end
end
