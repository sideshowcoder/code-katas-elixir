defmodule PPTax do
  import Dict, only: [get: 3, get: 2]

  defp _apply_tax(order, taxes) do
    net = get(order, :net_amount)
    tax_rate = get(taxes, get(order, :ship_to), 0)
    total = net * tax_rate + net
    Dict.put(order, :total_amount, total)
  end

  def apply_taxes(orders, taxes) do
    Enum.map(orders, _apply_tax(&1, taxes))
  end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]

orders = [
[ id: 123, ship_to: :NC, net_amount: 100.00 ],
[ id: 124, ship_to: :OK, net_amount: 35.50 ],
[ id: 125, ship_to: :TX, net_amount: 24.00 ],
[ id: 126, ship_to: :TX, net_amount: 44.80 ],
[ id: 127, ship_to: :NC, net_amount: 25.00 ],
[ id: 128, ship_to: :MA, net_amount: 10.00 ],
[ id: 129, ship_to: :CA, net_amount: 102.00 ],
[ id: 120, ship_to: :NC, net_amount: 50.00 ]
]

IO.inspect PPTax.apply_taxes(orders, tax_rates)
