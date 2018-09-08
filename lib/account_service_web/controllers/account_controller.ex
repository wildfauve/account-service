defmodule AccountServiceWeb.AccountController do
  use AccountServiceWeb, :controller

  alias AccountService.BillingEntities
  alias AccountService.BillingEntities.Account

  action_fallback AccountServiceWeb.FallbackController

  def index(conn, _params) do
    account = BillingEntities.list_account()
    render(conn, "index.json", account: account)
  end

  def create(conn, %{"account" => account_params}) do
    with {:ok, %Account{} = account} <- BillingEntities.create_account(account_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", account_path(conn, :show, account))
      |> render("show.json", account: account)
    end
  end

  def show(conn, %{"id" => id}) do
    account = BillingEntities.get_account!(id)
    render(conn, "show.json", account: account)
  end

  def update(conn, %{"id" => id, "account" => account_params}) do
    account = BillingEntities.get_account!(id)

    with {:ok, %Account{} = account} <- BillingEntities.update_account(account, account_params) do
      render(conn, "show.json", account: account)
    end
  end

  def delete(conn, %{"id" => id}) do
    account = BillingEntities.get_account!(id)
    with {:ok, %Account{}} <- BillingEntities.delete_account(account) do
      send_resp(conn, :no_content, "")
    end
  end
end
