defmodule ElixirHttp do
  use HTTPoison.Base

  def process_url(url) do
    "https://economia.awesomeapi.com.br/json/last/USD-BRL"
  end

  def process_response_body(body) do
    body
    |> Poison.decode!()
    |> Enum.map(fn {k, v} -> {String.to_atom(k), v} end)
  end

  # def process_response_body(body) do
  #   case Poison.decode(body) do
  #     {:ok, decoded_body} ->
  #       # fields = %{
  #       #   login: Map.get(decoded_body, "login"),
  #       #   name: Map.get(decoded_body, "name")
  #       # }
  #       extract_fields(decoded_body)

  #     {:error, _} ->
  #       IO.puts("Error decoding JSON response")
  #       %{}
  #   end
  # end

  # def extract_fields(%{"USDBRL" => usdbrl}) do
  #   IO.puts("USDBRL: #{usdbrl}")
  # end
end

# ElixirHttp.start
# IO.puts(ElixirHttp.get!("/users/joaopaulo-creator").body[:public_repos])
# defmodule HttpClientProject do
#   use HTTPoison.Base

#   def make_request(url) do
#     case get(url, []) do
#       {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
#         IO.puts("Response Body: #{body}")

#       {:ok, %HTTPoison.Response{status_code: status}} ->
#         IO.puts("Received a response with status: #{status}")

#       {:error, %HTTPoison.Error{reason: reason}} ->
#         IO.puts("Error: #{reason}")
#     end
#   end
# end
