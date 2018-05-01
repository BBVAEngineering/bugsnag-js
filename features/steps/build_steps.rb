When("the built apps") do |table|
  table.symbolic_hashes.each do |item|
    steps %Q{
      When I run the script "#{item[:command]}" synchronously
    }
  end
end
