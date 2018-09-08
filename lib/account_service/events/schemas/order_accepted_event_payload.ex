defmodule AccountService.Events.Schema.OrderAcceptedEventPayload do
  use Ecto.Schema

  import Ecto.Changeset

  @fields [:payment_method]

  embedded_schema do
    field :payment_method,      :string
  end

  @doc false
  def changeset(schema, params) do
    schema
    |> cast(params, @fields)
  end

end
