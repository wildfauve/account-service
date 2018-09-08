defmodule AccountServiceWeb.BillingEntityView do
  use AccountServiceWeb, :view
  alias AccountServiceWeb.BillingEntityView

  def render("index.json", %{billing_entity: billing_entity}) do
    %{data: render_many(billing_entity, BillingEntityView, "billing_entity.json")}
  end

  def render("show.json", %{billing_entity: billing_entity}) do
    %{data: render_one(billing_entity, BillingEntityView, "billing_entity.json")}
  end

  def render("billing_entity.json", %{billing_entity: billing_entity}) do
    %{id: billing_entity.id,
      name: billing_entity.name}
  end
end
