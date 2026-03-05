defmodule Demo do
  @moduledoc """
  Documentation for `Demo`.
  """

  @stream "demo-stream"

  def stream_name, do: @stream

  def put_records(count) do
    records =
      Enum.map(1..count, fn i ->
        %{
          "Data" => i |> :binary.encode_unsigned() |> Base.encode64(),
          "PartitionKey" => "partition-#{i}"
        }
      end)

    request("PutRecords", %{"StreamName" => @stream, "Records" => records})
  end

  def request(action, data) do
  end
end
