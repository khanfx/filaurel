=begin
5.times do |i|
    Ebill.create(
        userRef: "1",
        ebillRef: "#{1+i}",
        amount: 10.01 + 0.01*i,
        dateDue: Time.local(2022, 12, 31),
        billerRef: "1"
    )
end
=end
