defmodule WebdevFinalProjSms.SmsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WebdevFinalProjSms.Sms` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        location: "some location",
        store_id: 42
      })
      |> WebdevFinalProjSms.Sms.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        inventory: 42,
        name: "some name",
        retail_price: 120.5,
        vendor: "some vendor",
        wholesale_price: 120.5
      })
      |> WebdevFinalProjSms.Sms.create_product()

    product
  end
end
