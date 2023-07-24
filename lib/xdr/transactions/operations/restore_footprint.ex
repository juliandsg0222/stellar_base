defmodule StellarBase.XDR.Operations.RestoreFootprint do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `RestoreFootprint` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.ExtensionPoint

  @struct_spec XDR.Struct.new(ext: ExtensionPoint)

  @type ext_type :: ExtensionPoint.t()

  @type t :: %__MODULE__{ext: ext_type()}

  defstruct [:ext]

  @spec new(ext :: ext_type()) :: t()
  def new(%ExtensionPoint{} = ext),
    do: %__MODULE__{ext: ext}

  @impl true
  def encode_xdr(%__MODULE__{ext: ext}) do
    [ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{ext: ext}) do
    [ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [ext: ext]}, rest}} ->
        {:ok, {new(ext), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [ext: ext]}, rest} = XDR.Struct.decode_xdr!(bytes, struct)
    {new(ext), rest}
  end
end