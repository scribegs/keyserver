defmodule Keyserver.PublicJWK do
	alias __MODULE__
	import Keyserver.Utils, only: [map_keys_to_atoms: 1]

	@enforce_keys [:kty, :e, :use, :alg, :n]
	defstruct [:kty, :e, :use, :alg, :n]

	@type t :: %PublicJWK{
		kty: String.t,
		e: String.t,
		use: String.t,
		alg: String.t,
		n: String.t
	}

	def parse(json_blob) do
		Poison.decode!(json_blob)
		|> map_keys_to_atoms
		|> (& struct(PublicJWK, &1)).()
	end
end
