defmodule Keyserver.JWKTest do
	@moduledoc false

	use ExUnit.Case

	alias Keyserver.{PublicJWK}

	describe "parse/1" do
		test "it produces a properly formated JWK" do
			blob = %{
				kty: "RSA",
				e: "AQAB",
				use: "sig",
				alg: "RS256",
				n: "..."
			}
			|> Poison.encode!()
			|> PublicJWK.parse


			assert blob == %PublicJWK{
				kty: "RSA",
				e: "AQAB",
				use: "sig",
				alg: "RS256",
				n: "..."
			}
		end
	end
end
