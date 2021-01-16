require "database_connection.rb"
require "spec_helper.rb"

describe DatabaseConnection do

  describe "setup" do

    it "sets up a connection to production db" do
      DatabaseConnection.connect(false)
      expect(DatabaseConnection.db).to eq "production"
    end

    it "sets up a connection to testing db" do
      expect(DatabaseConnection.db).to eq "testing"
    end
    
  end

  it "returns all records" do
    records = DatabaseConnection.query("SELECT * FROM bookmarks")
    expect(records.ntuples).to eq 3
    expect(records).to include({"id" => "1", "url" => "http://www.makersacademy.com", "alias" => "Makers"})
  end

end