defmodule AccountService.Events.Domain.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias AccountService.Events.Domain.Event


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "events" do
    field :audit,       :map
    field :event,       :map
    field :event_id,    :string
    field :event_type,  :string
    field :state,       :string
    field :state_audit, {:array, :map}
    timestamps()
  end

  @doc false
  def changeset(%Event{} = event, attrs) do
    event
    |> cast(attrs, [:event_id, :event_type, :state, :event, :audit])
    |> validate_required([:event_id, :event_type, :state, :event, :audit])
  end
end
