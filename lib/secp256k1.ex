defmodule :libsecp256k1 do
  @compile {:autoload, false}
  @on_load {:init, 0}

  app = Mix.Project.config()[:app]

  def init do
    path = :filename.join(:code.priv_dir(unquote(app)), 'libsecp256k1_nif')
    :ok = :erlang.load_nif(path, 0)
  end

  @spec dsha256(binary()) :: binary() | no_return()
  def dsha256(_), do: :erlang.nif_error(:nif_library_not_loaded)

  def sha256(_), do: :erlang.nif_error(:nif_library_not_loaded)

  def hmac_sha256(_, _), do: :erlang.nif_error(:nif_library_not_loaded)

  def rand32(), do: :erlang.nif_error(:nif_library_not_loaded)

  def rand256(), do: :erlang.nif_error(:nif_library_not_loaded)

  def ec_seckey_verify(_), do: :erlang.nif_error(:nif_library_not_loaded)

  @spec ec_pubkey_create(binary(), :compressed| :uncompressed) :: {:ok, binary()} | {:error, String.t()} | no_return()
  def ec_pubkey_create(_, _), do: :erlang.nif_error(:nif_library_not_loaded)

  def ec_pubkey_decompress(_), do: :erlang.nif_error(:nif_library_not_loaded)

  def ec_pubkey_verify(_), do: :erlang.nif_error(:nif_library_not_loaded)

  def ec_privkey_export(_, _), do: :erlang.nif_error(:nif_library_not_loaded)

  def ec_privkey_import(_), do: :erlang.nif_error(:nif_library_not_loaded)

  def ec_privkey_tweak_add(_, _), do: :erlang.nif_error(:nif_library_not_loaded)

  def ec_pubkey_tweak_add(_, _), do: :erlang.nif_error(:nif_library_not_loaded)

  def ec_privkey_tweak_mul(_, _), do: :erlang.nif_error(:nif_library_not_loaded)

  def ec_pubkey_tweak_mul(_, _), do: :erlang.nif_error(:nif_library_not_loaded)

  def ecdsa_sign(_, _, _, _), do: :erlang.nif_error(:nif_library_not_loaded)

  def ecdsa_verify(_, _, _), do: :erlang.nif_error(:nif_library_not_loaded)

  @spec ecdsa_sign_compact(binary(), binary(), :default | :nonce_function_rfc6979,  binary()) :: {:ok, binary(), pos_integer()} | {:error, String.t()} | no_return
  def ecdsa_sign_compact(_, _, _, _), do: :erlang.nif_error(:nif_library_not_loaded)

  def ecdsa_verify_compact(_, _, _), do: :erlang.nif_error(:nif_library_not_loaded)

  @spec ecdsa_recover_compact(binary(), binary(), :uncompressed | :compressed,  pos_integer()) :: {:ok, binary()} | {:error, String.t()} | no_return
  def ecdsa_recover_compact(_hash, _signature, _compression, _), do: :erlang.nif_error(:nif_library_not_loaded)
end
