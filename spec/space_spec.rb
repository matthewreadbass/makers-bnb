require "space"

describe Space do
  describe "#all" do
    it "returns all spaces" do
      Space.add("Las Vegas", "Renting this place", "100", "26")
      spaces = Space.all
      expect(spaces).to include({ title: "Las Vegas", description: "Renting this place", price: "100", user_id: "26" })
    end
  end

  describe "#add" do
    it "adds new space to database" do
      Space.add("Las Vegas", "Renting this place", "100", "26")
      spaces = Space.all
      expect(spaces).to include({ title: "Las Vegas", description: "Renting this place", price: "100", user_id: "26" })
    end
  end
end
