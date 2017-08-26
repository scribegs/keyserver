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

			assert elem(blob, 0) == :ok
		end

		test "it throws an error if there is missing data" do
			blob = %{
				kty: "RSA"
			}
			|> Poison.encode!()
			|> PublicJWK.parse

			assert elem(blob, 0) == :error
		end
	end
end
