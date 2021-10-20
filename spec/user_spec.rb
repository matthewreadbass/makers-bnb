require "user"

describe User do
  describe "#all" do
    it "returns all users" do
      User.create("Bob", "bob@email.com", "bob123")

      users = User.all

      expect(users).to include({ name: "Bob", email: "bob@email.com", password: "bob123" })
    end
  end

  describe "#create" do
    it "adds new user to database" do
      User.create("John", "john@email.com", "john123")

      users = User.all

      expect(users).to include({ name: "John", email: "john@email.com", password: "john123" })
    end
  end
end
