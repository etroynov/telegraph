defmodule Telegraph.EncoderTest do
  use ExUnit.Case, async: true

  alias Telegraph.Model.{InlineKeyboardButton}

  test "inline keyboard button excludes unknown keys as json" do
    json = Jason.encode!(%InlineKeyboardButton{})

    assert json == "{}"
  end
end
