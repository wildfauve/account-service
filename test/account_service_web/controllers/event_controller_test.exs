defmodule AccountServiceWeb.EventControllerTest do
  use AccountServiceWeb.ConnCase

  alias AccountService.Events
  alias AccountService.Events.Event

  @order_event %{
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

  @invalid_attrs %{audit: nil, event: nil, event_id: nil, event_type: nil, state: nil}

  def fixture(:event) do
    {:ok, event} = Events.create_event(@order_event)
    event
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "handle event" do
    test "creates the event, invoice, and performs financial posting", %{conn: conn} do
      # conn = post conn, event_path(conn, :create), event: @order_event

      response = conn
      |> post(event_path(conn, :create), event: @order_event)
      |> json_response(201)

      assert response["id"] == "1"

    end

    test "renders errors when data is invalid", %{conn: conn} do
      # conn = post conn, event_path(conn, :create), event: @invalid_attrs
      # assert json_response(conn, 422)["errors"] != %{}
    end

    test "returns a 201 response"
    test "should return the same event when a duplicate is posted"
    test "should return the error created by the original event when a duplicate is sent"

  end


  defp create_event(_) do
    event = fixture(:event)
    {:ok, event: event}
  end
end
