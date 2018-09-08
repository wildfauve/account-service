defmodule AccountService.BillingEntitiesTest do
  use AccountService.DataCase

  alias AccountService.BillingEntities

  describe "billing_entity" do
    alias AccountService.BillingEntities.BillingEntity

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def billing_entity_fixture(attrs \\ %{}) do
      {:ok, billing_entity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BillingEntities.create_billing_entity()

      billing_entity
    end

    test "list_billing_entity/0 returns all billing_entity" do
      billing_entity = billing_entity_fixture()
      assert BillingEntities.list_billing_entity() == [billing_entity]
    end

    test "get_billing_entity!/1 returns the billing_entity with given id" do
      billing_entity = billing_entity_fixture()
      assert BillingEntities.get_billing_entity!(billing_entity.id) == billing_entity
    end

    test "create_billing_entity/1 with valid data creates a billing_entity" do
      assert {:ok, %BillingEntity{} = billing_entity} = BillingEntities.create_billing_entity(@valid_attrs)
      assert billing_entity.name == "some name"
    end

    test "create_billing_entity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BillingEntities.create_billing_entity(@invalid_attrs)
    end

    test "update_billing_entity/2 with valid data updates the billing_entity" do
      billing_entity = billing_entity_fixture()
      assert {:ok, billing_entity} = BillingEntities.update_billing_entity(billing_entity, @update_attrs)
      assert %BillingEntity{} = billing_entity
      assert billing_entity.name == "some updated name"
    end

    test "update_billing_entity/2 with invalid data returns error changeset" do
      billing_entity = billing_entity_fixture()
      assert {:error, %Ecto.Changeset{}} = BillingEntities.update_billing_entity(billing_entity, @invalid_attrs)
      assert billing_entity == BillingEntities.get_billing_entity!(billing_entity.id)
    end

    test "delete_billing_entity/1 deletes the billing_entity" do
      billing_entity = billing_entity_fixture()
      assert {:ok, %BillingEntity{}} = BillingEntities.delete_billing_entity(billing_entity)
      assert_raise Ecto.NoResultsError, fn -> BillingEntities.get_billing_entity!(billing_entity.id) end
    end

    test "change_billing_entity/1 returns a billing_entity changeset" do
      billing_entity = billing_entity_fixture()
      assert %Ecto.Changeset{} = BillingEntities.change_billing_entity(billing_entity)
    end
  end

  describe "account" do
    alias AccountService.BillingEntities.Account

    @valid_attrs %{name: "some name", purpose: "some purpose"}
    @update_attrs %{name: "some updated name", purpose: "some updated purpose"}
    @invalid_attrs %{name: nil, purpose: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BillingEntities.create_account()

      account
    end

    test "list_account/0 returns all account" do
      account = account_fixture()
      assert BillingEntities.list_account() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert BillingEntities.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = BillingEntities.create_account(@valid_attrs)
      assert account.name == "some name"
      assert account.purpose == "some purpose"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BillingEntities.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, account} = BillingEntities.update_account(account, @update_attrs)
      assert %Account{} = account
      assert account.name == "some updated name"
      assert account.purpose == "some updated purpose"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = BillingEntities.update_account(account, @invalid_attrs)
      assert account == BillingEntities.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = BillingEntities.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> BillingEntities.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = BillingEntities.change_account(account)
    end
  end
end
