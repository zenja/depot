Order.transaction do
  (1..100).each do |i|
    Order.create(
      name: "Cuatomer #{i}", 
      address: "Address #{i}", 
      email: "user#{i}@gmail.com", 
      pay_type: 'Check')
  end
end
