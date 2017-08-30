#require 'helper'

describe PersistentSub do

  describe 'before callbacks' do
    it 'executes before wrapped block' do
      expect(1).to eq 1
    end
  end

end
