defmodule Telegraph.APITest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest Telegraph.API
  alias Telegraph.API

  setup_all do
    unless Application.get_env(:telegraph, :token) do
      Application.put_env(:telegraph, :token, "304884665:AAE1ItId1gf9MsM-Smrv9sPc0glmB2HkMAo")
    end

    :ok
  end

  setup do
    ExVCR.Config.filter_sensitive_data("bot[^/]+/", "bot<TOKEN>/")
    :ok
  end

  test "request_with_map" do
    use_cassette "api_request_with_map", match_requests_on: [:request_body] do
      assert [] == API.request?("getUpdates", %{"limit" => 4})
    end
  end

  test "build_file_url" do
    assert API.build_file_url("document/file_10") ==
             "https://api.telegram.org/file/bot#{Telegraph.Config.token()}/document/file_10"
  end
end
