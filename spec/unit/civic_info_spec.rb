require 'spec_helper'

describe CivicInfo do
  describe '#initialize' do
    context 'has api key' do
      it 'have a google api key' do
        ci = CivicInfo.new()
        ci.instance_variable_get(:@google_api).class.should == GoogleAPI
      end
    end

    context 'no api key' do
      it 'fails' do
        pending 'how to fake env variables?'
        -> {CivicInfo.new() }.should raise_error
      end
    end
  end
  
  describe '#elections' do
    it 'gets election info' do
      ci = CivicInfo.new()
      ci.elections[:kind].should == 'civicinfo#electionsQueryResponse'
    end
  end

  describe '#voter_info' do
    it 'gets voter info' do
      ci = CivicInfo.new()
      ci.voter_info(4000, 'Market Street Station Denver, CO')
    end
  end

end
