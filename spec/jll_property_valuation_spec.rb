require 'spec_helper'

RSpec.describe JllPropertyValuation do
  it "has a version number" do
    expect(JllPropertyValuation::VERSION).not_to be nil
  end

  it "version number is 0.1.0" do
    expect(JllPropertyValuation::VERSION).to eq("0.1.0")
  end
end
