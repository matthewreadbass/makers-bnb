require "space"
require "pg"
require "database_helpers"

describe Space do
  describe "#all" do
    it "returns all spaces" do
      db = PG.connect(dbname: "makersbnb_test")

      db.exec("INSERT INTO spaces (title, description, price, available_from, available_to) VALUES ('Las Vegas', 'Renting this place', 100, '2021-10-19', '2021-10-26');")
      spaces = Space.all

      expect(spaces[0].title).to eq "Las Vegas"
      expect(spaces[0].description).to eq "Renting this place"
    end
  end

  describe "#add" do
    it "adds new space to database" do
      space = Space.add(title: "Las Vegas", description: "Renting this place", price: "100", available_from: "2021-10-19", available_to: "2021-10-26")
      persisted_data = persisted_data(id: space.id)

      spaces = Space.all

      expect(space.title).to eq "Las Vegas"
      expect(space.description).to eq "Renting this place"
      expect(space).to be_a Space
      expect(space.id).to eq space.id
    end
  end

  describe ".find" do
    it "returns the requested bookmark object" do
      space = Space.add(title: "Cozy Cottage", description: "Small cottage in the Cotswolds", price: "100", available_from: "2021-10-25", available_to: "2021-11-25")

      result = Space.find(id: space.id)

      expect(result).to be_a Space
      expect(result.id).to eq space.id
      expect(result.title).to eq "Cozy Cottage"
      expect(result.description).to eq "Small cottage in the Cotswolds"
    end
  end
end
