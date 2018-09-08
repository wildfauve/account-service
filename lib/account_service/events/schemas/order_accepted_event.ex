defmodule AccountService.Events.Schema.OrderAcceptedEvent do
  use Ecto.Schema

  alias AccountService.Events.Schema.OrderAcceptedEvent
  alias AccountService.Events.Schema.OrderAcceptedEventPayload
  import Ecto.Changeset

  @fields [:id, :_type, :version, :eventType, :trace, :causationId, :correlationId, :dateOfEventCreation]

  embedded_schema do
    field :_type,               :string
    field :version,             :string
    field :eventType,           :string
    field :trace,               :string
    field :causationId,         :string
    field :correlationId,       :string
    field :dateOfEventCreation, :string
    embeds_one :payload,        OrderAcceptedEventPayload
  end


  @doc false
  def changeset(attrs) do
    %OrderAcceptedEvent{}
    |> cast(attrs, @fields)
    |> validate_required([:id, :eventType, :dateOfEventCreation])
    |> cast_embed(:payload)
  end
end
