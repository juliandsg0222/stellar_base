defmodule StellarBase.XDR.TransactionMetaV1 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TransactionMetaV1` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    LedgerEntryChanges,
    OperationMetaList
  }

  @struct_spec XDR.Struct.new(
                 tx_changes: LedgerEntryChanges,
                 operations: OperationMetaList
               )

  @type tx_changes_type :: LedgerEntryChanges.t()
  @type operations_type :: OperationMetaList.t()

  @type t :: %__MODULE__{tx_changes: tx_changes_type(), operations: operations_type()}

  defstruct [:tx_changes, :operations]

  @spec new(tx_changes :: tx_changes_type(), operations :: operations_type()) :: t()
  def new(
        %LedgerEntryChanges{} = tx_changes,
        %OperationMetaList{} = operations
      ),
      do: %__MODULE__{tx_changes: tx_changes, operations: operations}

  @impl true
  def encode_xdr(%__MODULE__{tx_changes: tx_changes, operations: operations}) do
    [tx_changes: tx_changes, operations: operations]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{tx_changes: tx_changes, operations: operations}) do
    [tx_changes: tx_changes, operations: operations]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [tx_changes: tx_changes, operations: operations]}, rest}} ->
        {:ok, {new(tx_changes, operations), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [tx_changes: tx_changes, operations: operations]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(tx_changes, operations), rest}
  end
end