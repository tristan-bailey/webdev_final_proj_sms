defmodule WebdevFinalProjSms.SmsTest do
  use WebdevFinalProjSms.DataCase

  alias WebdevFinalProjSms.Sms

  describe "stores" do
    alias WebdevFinalProjSms.Sms.Store

    import WebdevFinalProjSms.SmsFixtures

    @invalid_attrs %{location: nil, store_id: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Sms.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Sms.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{location: "some location", store_id: 42}

      assert {:ok, %Store{} = store} = Sms.create_store(valid_attrs)
      assert store.location == "some location"
      assert store.store_id == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sms.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{location: "some updated location", store_id: 43}

      assert {:ok, %Store{} = store} = Sms.update_store(store, update_attrs)
      assert store.location == "some updated location"
      assert store.store_id == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Sms.update_store(store, @invalid_attrs)
      assert store == Sms.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Sms.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Sms.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Sms.change_store(store)
    end
  end

  describe "products" do
    alias WebdevFinalProjSms.Sms.Product

    import WebdevFinalProjSms.SmsFixtures

    @invalid_attrs %{inventory: nil, name: nil, retail_price: nil, vendor: nil, wholesale_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Sms.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Sms.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{inventory: 42, name: "some name", retail_price: 120.5, vendor: "some vendor", wholesale_price: 120.5}

      assert {:ok, %Product{} = product} = Sms.create_product(valid_attrs)
      assert product.inventory == 42
      assert product.name == "some name"
      assert product.retail_price == 120.5
      assert product.vendor == "some vendor"
      assert product.wholesale_price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sms.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{inventory: 43, name: "some updated name", retail_price: 456.7, vendor: "some updated vendor", wholesale_price: 456.7}

      assert {:ok, %Product{} = product} = Sms.update_product(product, update_attrs)
      assert product.inventory == 43
      assert product.name == "some updated name"
      assert product.retail_price == 456.7
      assert product.vendor == "some updated vendor"
      assert product.wholesale_price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Sms.update_product(product, @invalid_attrs)
      assert product == Sms.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Sms.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Sms.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Sms.change_product(product)
    end
  end
end
