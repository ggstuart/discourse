require 'spec_helper'

describe SearchController do

  it 'performs the query' do
    m = Guardian.new(nil)
    Guardian.stubs(:new).returns(m)
    Search.expects(:query).with('test', m, nil, 3)
    xhr :get, :query, term: 'test'
  end

  it 'performs the query with a filter' do
    m = Guardian.new(nil)
    Guardian.stubs(:new).returns(m)
    Search.expects(:query).with('test', m, 'topic', 3)
    xhr :get, :query, term: 'test', type_filter: 'topic'
  end

end
