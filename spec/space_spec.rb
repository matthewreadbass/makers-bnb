require "space"

describe Space do
  describe "#all" do
    it "returns all spaces" do
      Space.add("Las Vegas", "Renting this place", "100", "2021-10-19", "2021-10-26")

      spaces = Space.all

      expect(spaces).to include({ title: "Las Vegas", description: "Renting this place", price: "100", available_from: "2021-10-19", available_to: "2021-10-26", availablity: "t" })
    end
  end

  describe "#add" do
    it "adds new space to database" do
      Space.add("Las Vegas", "Renting this place", "100", "2021-10-19", "2021-10-26")

      spaces = Space.all

      expect(spaces).to include({ title: "Las Vegas", description: "Renting this place", price: "100", available_from: "2021-10-19", available_to: "2021-10-26", availablity: "t" })
    end
  end
end
