require "times"

describe Times do
  describe "#create" do
    it "creates a new instance of an available property" do
      Times.create("2021-10-20", "2021-11-20")

      times = Times.all

      expect(times).to include({ available_from: "2021-10-20", available_to: "2021-11-20" })
    end
  end
  describe "#all" do
    it "lists all available timeslots" do
      Times.create("2021-10-20", "2021-11-20")

      times = Times.all

      expect(times).to include({ available_from: "2021-10-20", available_to: "2021-11-20" })
    end
  end
end
