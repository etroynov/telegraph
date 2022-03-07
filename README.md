# Telegraph



<div align="center">

Modern Telegram Bot API framework based on Nadia project ([document](https://hexdocs.pm/telegraph/), [Telegram Bot API](https://core.telegram.org/bots/api))

[![Module Version](https://img.shields.io/hexpm/v/telegraph.svg)](https://hex.pm/packages/telegraph)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/telegraph/)
[![Total Download](https://img.shields.io/hexpm/dt/telegraph.svg)](https://hex.pm/packages/telegraph)
[![License](https://img.shields.io/hexpm/l/telegraph.svg)](https://github.com/etroynov/telegraph/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/etroynov/telegraph.svg)](https://github.com/etroynov/telegraph/commits/master)

[![Bot API](https://img.shields.io/badge/Bot%20API-v.5.5-00aced.svg?style=flat-square&logo=telegram)](https://core.telegram.org/bots/api)
[![Elixir CI](https://github.com/etroynov/telegraph/actions/workflows/elixir.yml/badge.svg)](https://github.com/etroynov/telegraph/actions/workflows/elixir.yml)


[![https://telegram.me/ntbasupport](https://img.shields.io/badge/💬%20Telegram-Group-blue.svg?style=flat-square)](https://t.me/+bYp1NseULwliNmVi)
[![https://telegram.me/utroynov](https://img.shields.io/badge/💬%20Telegram-Evgenii_Troinov-blue.svg?style=flat-square)](https://telegram.me/utroynov)

</div>

## Installation

Add `:telegraph` to your `mix.exs` dependencies:

```elixir
def deps do
  [
    {:telegraph, "~> 0.7.0"}
  ]
end
```

And run `$ mix deps.get`.

## Configuration

In `config/config.exs`, add your Telegram Bot token like [this](config/config.exs.example)

```elixir
config :telegraph,
  token: "bot token"
```

You can also add an optional `recv_timeout` in seconds (defaults to 5s):

```elixir
config :telegraph,
  recv_timeout: 10
```

You can also add a proxy support:

```elixir
config :telegraph,
  proxy: "http://proxy_host:proxy_port", # or {:socks5, 'proxy_host', proxy_port}
  proxy_auth: {"user", "password"},
  ssl: [versions: [:'tlsv1.2']]
```

You can also configure the the base url for the api if you need to for some
reason:

```elixir
config :telegraph,
  # Telegram API. Default: https://api.telegram.org/bot
  base_url: "http://my-own-endpoint.com/whatever/",

  # Telegram Graph API. Default: https://api.telegra.ph
  graph_base_url: "http://my-own-endpoint.com/whatever/"
```

Environment variables may be used as well:

```elixir
config :telegraph,
  token: {:system, "ENVVAR_WITH_MYAPP_TOKEN", "default_value_if_needed"}
```

## Usage

### `get_me`

```elixir
iex> Telegraph.get_me
{:ok,
 %Telegraph.Model.User{first_name: "Telegraph", id: 666, last_name: nil,
  username: "telegraph_bot"}}
```

### `get_updates`

```elixir
iex> Telegraph.get_updates limit: 5
{:ok, []}

iex> {:ok,
 [%Telegraph.Model.Update{callback_query: nil, chosen_inline_result: nil,
   edited_message: nil, inline_query: nil,
   message: %Telegraph.Model.Message{audio: nil, caption: nil,
    channel_chat_created: nil,
    chat: %Telegraph.Model.Chat{first_name: "Telegraph", id: 123,
     last_name: "TheBot", title: nil, type: "private", username: "telegraph_the_bot"},
    contact: nil, date: 1471208260, delete_chat_photo: nil, document: nil,
    edit_date: nil, entities: nil, forward_date: nil, forward_from: nil,
    forward_from_chat: nil,
    from: %Telegraph.Model.User{first_name: "Telegraph", id: 123,
     last_name: "TheBot", username: "telegraph_the_bot"}, group_chat_created: nil,
    left_chat_member: nil, location: nil, message_id: 543,
    migrate_from_chat_id: nil, migrate_to_chat_id: nil, new_chat_member: nil,
    new_chat_photo: [], new_chat_title: nil, photo: [], pinned_message: nil,
    reply_to_message: nil, sticker: nil, supergroup_chat_created: nil,
    text: "rew", venue: nil, video: nil, voice: nil}, update_id: 98765}]}
```

### `send_message`

```elixir
iex> case Telegraph.send_message(tlg_id, "The message text goes here") do
  {:ok, _result} ->
    :ok
  {:error, %Telegraph.Model.Error{reason: "Please wait a little"}} ->
    :wait
  end

:ok
```

Refer to [Telegraph document](https://hexdocs.pm/telegraph/) and [Telegram Bot API document](https://core.telegram.org/bots/api) for more details.

## Copyright and License

Copyright (c) 2022 Evgenii Troinov
Copyright (c) 2015 Yu Zhang

This library licensed under the [MIT license](./LICENSE.md).
