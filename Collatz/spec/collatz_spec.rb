require 'spec_helper'
require 'collatz'

RSpec.describe Collatz, type: :model do
  describe 'collatz should work' do
    vals = [1,1,2,2,3,8,4,3,5,6,6,9,7,17]
    while vals.length > 0 do
      i = vals.shift()
      e = vals.shift()
      it "should return #{e} when given #{i}" do
        l,li = Collatz.collatz(i)
        expect(l).to be e
      end
    end
  end
end