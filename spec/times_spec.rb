require "times"

describe Times do
  describe "#create" do
    it "creates a new instance of an available property" do
      Times.create("40", "2021-10-20", "2021-11-20")
      times = Times.all
      expect(times).to include({ space_id: "40", available_from: "2021-10-20", available_to: "2021-11-20" })
    end
  end
  describe "#all" do
    it "lists all available timeslots" do
      Times.create("40", "2021-10-20", "2021-11-20")
      times = Times.all
      expect(times).to include({ space_id: "40", available_from: "2021-10-20", available_to: "2021-11-20" })
    end
  end
  describe "#available?" do
    it "returns true if a space is available on a specified date" do
      Times.create("40", "2021-10-20", "2021-11-20")
      times = Times.available?("40", "2021-10-21")
      expect(times).to eq true
    end
    it "returns false if a space is not available on a specified date" do
      Times.create("40", "2021-10-20", "2021-11-20")
      times = Times.available?("40", "2021-12-25")
      expect(times).to eq false
    end
  end
end
