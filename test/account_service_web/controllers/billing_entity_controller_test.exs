defmodule AccountServiceWeb.BillingEntityControllerTest do
  use AccountServiceWeb.ConnCase

  alias AccountService.BillingEntities
  alias AccountService.BillingEntities.BillingEntity

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:billing_entity) do
    {:ok, billing_entity} = BillingEntities.create_billing_entity(@create_attrs)
    billing_entity
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all billing_entity", %{conn: conn} do
      conn = get conn, billing_entity_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create billing_entity" do
    test "renders billing_entity when data is valid", %{conn: conn} do
      conn = post conn, billing_entity_path(conn, :create), billing_entity: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, billing_entity_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, billing_entity_path(conn, :create), billing_entity: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update billing_entity" do
    setup [:create_billing_entity]

    test "renders billing_entity when data is valid", %{conn: conn, billing_entity: %BillingEntity{id: id} = billing_entity} do
      conn = put conn, billing_entity_path(conn, :update, billing_entity), billing_entity: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, billing_entity_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, billing_entity: billing_entity} do
      conn = put conn, billing_entity_path(conn, :update, billing_entity), billing_entity: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete billing_entity" do
    setup [:create_billing_entity]

    test "deletes chosen billing_entity", %{conn: conn, billing_entity: billing_entity} do
      conn = delete conn, billing_entity_path(conn, :delete, billing_entity)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, billing_entity_path(conn, :show, billing_entity)
      end
    end
  end

  defp create_billing_entity(_) do
    billing_entity = fixture(:billing_entity)
    {:ok, billing_entity: billing_entity}
  end
end
