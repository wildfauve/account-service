defmodule AccountService.Schema.OrderAcceptedEvent do
  use AccountService.DataCase

  alias AccountService.Events.Schema.OrderAcceptedEvent

  describe "order accepted event validation" do

    @valid_event %{
      _type: "domain_event",
      version: "0.0.1",
      eventType: "order.accepted",
      id: "bbdb87ed-2227-4c69-8a4c-9ac013a585e3",
      trace: nil,
      causationId: nil,
      correlationId: nil,
      dateOfEventCreation: "2018-03-15T00:01:55Z",
      payload: %{
        payment_method: "by_invoice"
      }
    }

    test "event valid" do
      changeset = OrderAcceptedEvent.changeset(@valid_event)
      require IEx
      IEx.pry()
      # assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
