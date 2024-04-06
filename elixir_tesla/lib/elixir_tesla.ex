defmodule Client do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://economia.awesomeapi.com.br/json/last/")
  plug(Tesla.Middleware.JSON)

  def get_quotation do
    get("USD-BRL")
  end

  # No caso dessa função, por enquanto é isso, mas eu preciso lidar com uma chave dinamica
  # ou seja, nem sempre a chave da minha request vai "USDBRL", sendo assim, será criado
  # será criado
  def run do
    {:ok, response} = get_quotation()
    body = response.body
    data = Map.get(body, "USDBRL", %{})

    ask = Map.get(data, "ask", "N/A")

    # printando somente uma string no output. Por padrão, é printado um hashmap, que por acaso tem um sintaxe bem feia para se ler
    IO.puts("Valor da cotação atual: #{ask}")
  end

  def dynamic do
    {:ok, response} = get_quotation()
    body = response.body

    case Map.keys(body) do
      [pair_key | _rest] ->
        data = Map.get(body, pair_key, %{})
        # o argumento do meio representa o campo a ser extraído
        ask = Map.get(data, "ask", "N/A")
        code = Map.get(data, "code", "N/A")
        IO.puts("Mode: #{code}\nValor da cotação atual: #{ask}")
    end
  end
end
