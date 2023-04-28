defmodule WebdevFinalProjSms.Sms.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias WebdevFinalProjSms.Sms.Store

  schema "products" do
    field :inventory, :integer
    field :name, :string
    field :retail_price, :float
    field :vendor, :string
    field :wholesale_price, :float
    belongs_to :store, Store

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :vendor, :wholesale_price, :retail_price, :inventory, :store_id])
    |> validate_required([:name, :vendor, :wholesale_price, :retail_price, :inventory, :store_id])
  end
end
