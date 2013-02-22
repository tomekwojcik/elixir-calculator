defmodule Calculator do
    defp to_number(x) do
        if not List.member?(x, ?.) do
            x = x ++ '.0'
        end

        list_to_float(x)
    end

    defp add(operands) when is_list(operands) do
        [head | tail] = operands
        Enum.reduce(tail, to_number(head), fn(x, acc) -> to_number(x) + acc end)
    end

    defp sub(operands) when is_list(operands) do
        [head | tail] = operands
        Enum.reduce(tail, to_number(head), fn(x, acc) -> acc - to_number(x) end)
    end

    defp mul(operands) when is_list(operands) do
        [head | tail] = operands
        Enum.reduce(tail, to_number(head), fn(x, acc) -> to_number(x) * acc end)
    end

    defp div(operands) when is_list(operands) do
        [head | tail] = operands
        Enum.reduce(tail, to_number(head), fn(x, acc) -> acc / to_number(x) end)
    end

    defp usage do
        IO.puts("usage: calculator command operands...")
        IO.puts("")
        IO.puts("Available commands:")
        IO.puts("calculator add     # Add operands")
        IO.puts("calculator sub     # Subtract operands")
        IO.puts("calculator mul     # Multiply operands")
        IO.puts("calculator div     # Divide operands")
    end

    def main([]) do
        usage()
    end

    def main(argv) when length(argv) == 1 do
        usage()
    end

    def main(argv) do
        [command | operands] = argv

        result = nil
        case command do
            'add' -> result = add(operands)
            'sub' -> result = sub(operands)
            'mul' -> result = mul(operands)
            'div' -> result = div(operands)
            _ -> usage()
        end

        if result != nil do
            IO.puts(result)
        end
    end
end
