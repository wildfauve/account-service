defmodule AccountServiceWeb.BillingEntityController do
  use AccountServiceWeb, :controller

  alias AccountService.BillingEntities
  alias AccountService.BillingEntities.BillingEntity

  action_fallback AccountServiceWeb.FallbackController

  def index(conn, _params) do
    billing_entity = BillingEntities.list_billing_entity()
    render(conn, "index.json", billing_entity: billing_entity)
  end

  def create(conn, %{"billing_entity" => billing_entity_params}) do
    with {:ok, %BillingEntity{} = billing_entity} <- BillingEntities.create_billing_entity(billing_entity_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", billing_entity_path(conn, :show, billing_entity))
      |> render("show.json", billing_entity: billing_entity)
    end
  end

  def show(conn, %{"id" => id}) do
    billing_entity = BillingEntities.get_billing_entity!(id)
    render(conn, "show.json", billing_entity: billing_entity)
  end

  def update(conn, %{"id" => id, "billing_entity" => billing_entity_params}) do
    billing_entity = BillingEntities.get_billing_entity!(id)

    with {:ok, %BillingEntity{} = billing_entity} <- BillingEntities.update_billing_entity(billing_entity, billing_entity_params) do
      render(conn, "show.json", billing_entity: billing_entity)
    end
  end

  def delete(conn, %{"id" => id}) do
    billing_entity = BillingEntities.get_billing_entity!(id)
    with {:ok, %BillingEntity{}} <- BillingEntities.delete_billing_entity(billing_entity) do
      send_resp(conn, :no_content, "")
    end
  end
end
