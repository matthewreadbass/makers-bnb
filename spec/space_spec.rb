require "space"

describe Space do
  describe "#all" do
    it "returns all spaces" do
      Space.add("Las Vegas", "Renting this place", "100", "2021-10-19", "2021-10-26")

      spaces = Space.all

      # expect(spaces).to include({ title: "Las Vegas", description: "Renting this place", price: "100", available_from: "2021-10-19", available_to: "2021-10-26" })
      expect(spaces).to include({ title: "Las Vegas", description: "Renting this place", price: "100", available_from: "2021-10-19", available_to: "2021-10-26", available: "t" })
    end
  end

  describe "#add" do
    it "adds new space to database" do
      Space.add("Las Vegas", "Renting this place", "100", "2021-10-19", "2021-10-26")

      spaces = Space.all

      expect(spaces).to include({ title: "Las Vegas", description: "Renting this place", price: "100", available_from: "2021-10-19", available_to: "2021-10-26", available: "t" })
    end
  end

  # describe "#find" do
  #   it "retreives the id of a space from the database" do
  #     space = Space.add("Cozy Cottage", "Small cottage in the Cotswolds", "100", "2021-10-25", "2021-11-25")
  #     connection = PG.connect(dbname: "makersbnb_test")
  #     id = connection.exec_params("SELECT id FROM spaces WHERE title = 'Cozy Cottage';")

  #     result = Space.find(id[0]["id"])

  #     expect(result.to_a).to eq([{ "available" => "t", "available_from" => "2021-10-25", "available_to" => "2021-11-25", "description" => "Small cottage in the Cotswolds", "id" => "1", "price" => "100", "title" => "Cozy Cottage" }])
  #   end
  # end

  describe ".find" do
    it "returns the requested bookmark object" do
      space = Space.add(title: "Cozy Cottage", description: "Small cottage in the Cotswolds", price: "100", available_from: "2021-10-25", available_to: "2021-11-25")

      result = Space.find(id: space.id)

      expect(result).to be_a Space
      expect(result.id).to eq space.id
      expect(result.title).to eq "Cozy Cottage"
      expect(result.descritopn).to eq "Small cottage in the Cotswolds"
    end
  end
end
