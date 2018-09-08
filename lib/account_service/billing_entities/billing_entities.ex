defmodule AccountService.BillingEntities do
  @moduledoc """
  The BillingEntities context.
  """

  import Ecto.Query, warn: false
  alias AccountService.Repo

  alias AccountService.BillingEntities.BillingEntity

  @doc """
  Returns the list of billing_entity.

  ## Examples

      iex> list_billing_entity()
      [%BillingEntity{}, ...]

  """
  def list_billing_entity do
    Repo.all(BillingEntity)
  end

  @doc """
  Gets a single billing_entity.

  Raises `Ecto.NoResultsError` if the Billing entity does not exist.

  ## Examples

      iex> get_billing_entity!(123)
      %BillingEntity{}

      iex> get_billing_entity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_billing_entity!(id), do: Repo.get!(BillingEntity, id)

  @doc """
  Creates a billing_entity.

  ## Examples

      iex> create_billing_entity(%{field: value})
      {:ok, %BillingEntity{}}

      iex> create_billing_entity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_billing_entity(attrs \\ %{}) do
    %BillingEntity{}
    |> BillingEntity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a billing_entity.

  ## Examples

      iex> update_billing_entity(billing_entity, %{field: new_value})
      {:ok, %BillingEntity{}}

      iex> update_billing_entity(billing_entity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_billing_entity(%BillingEntity{} = billing_entity, attrs) do
    billing_entity
    |> BillingEntity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BillingEntity.

  ## Examples

      iex> delete_billing_entity(billing_entity)
      {:ok, %BillingEntity{}}

      iex> delete_billing_entity(billing_entity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_billing_entity(%BillingEntity{} = billing_entity) do
    Repo.delete(billing_entity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking billing_entity changes.

  ## Examples

      iex> change_billing_entity(billing_entity)
      %Ecto.Changeset{source: %BillingEntity{}}

  """
  def change_billing_entity(%BillingEntity{} = billing_entity) do
    BillingEntity.changeset(billing_entity, %{})
  end

  alias AccountService.BillingEntities.Account

  @doc """
  Returns the list of account.

  ## Examples

      iex> list_account()
      [%Account{}, ...]

  """
  def list_account do
    Repo.all(Account)
  end

  @doc """
  Gets a single account.

  Raises `Ecto.NoResultsError` if the Account does not exist.

  ## Examples

      iex> get_account!(123)
      %Account{}

      iex> get_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account!(id), do: Repo.get!(Account, id)

  @doc """
  Creates a account.

  ## Examples

      iex> create_account(%{field: value})
      {:ok, %Account{}}

      iex> create_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account.

  ## Examples

      iex> update_account(account, %{field: new_value})
      {:ok, %Account{}}

      iex> update_account(account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Account.

  ## Examples

      iex> delete_account(account)
      {:ok, %Account{}}

      iex> delete_account(account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account changes.

  ## Examples

      iex> change_account(account)
      %Ecto.Changeset{source: %Account{}}

  """
  def change_account(%Account{} = account) do
    Account.changeset(account, %{})
  end
end
