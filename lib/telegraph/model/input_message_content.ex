defmodule Telegraph.Model.InputMessageContent do
  @type t ::
          Telegraph.Model.InputMessageContent.Text.t()
          | Telegraph.Model.InputMessageContent.Location.t()
          | Telegraph.Model.InputMessageContent.Venue.t()
          | Telegraph.Model.InputMessageContent.Contact.t()

  defmodule Text do
    @derive Jason.Encoder
    defstruct message_text: nil, parse_mode: nil, disable_web_page_preview: false
    @type t :: %Text{message_text: binary, parse_mode: binary, disable_web_page_preview: atom}
  end

  defmodule Location do
    @derive Jason.Encoder
    defstruct latitude: nil, longitude: nil
    @type t :: %Location{latitude: float, longitude: float}
  end

  defmodule Venue do
    @derive Jason.Encoder
    defstruct latitude: nil, longitude: nil, title: nil, address: nil, foursquare_id: nil

    @type t :: %Venue{
            latitude: float,
            longitude: float,
            title: binary,
            address: binary,
            foursquare_id: binary
          }
  end

  defmodule Contact do
    @derive Jason.Encoder
    defstruct phone_number: nil, first_name: nil, last_name: nil
    @type t :: %Contact{phone_number: binary, first_name: binary, last_name: binary}
  end
end
