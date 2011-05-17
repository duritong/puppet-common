#! /usr/bin/env ruby

require File.dirname(__FILE__) + '/../../../spec_helper'

describe "the hash_merge function" do

  before :each do
    @scope = Puppet::Parser::Scope.new
  end

  it "should exist" do
    Puppet::Parser::Functions.function("hash_merge").should == "function_hash_merge"
  end

  it "should raise a ParseError if there is less than 2 arguments" do
    lambda { @scope.function_hash_merge(["foo"]) }.should( raise_error(Puppet::ParseError))
  end

  it "should raise a ParseError if there is more than 2 arguments" do
    lambda { @scope.function_hash_merge(["foo", "bar", "gazonk"]) }.should( raise_error(Puppet::ParseError))
  end

  it "should merge the two hashes" do
    result = @scope.function_hash_merge([{'a' => 1 ,'b' => 2},{'b' => 3, 'c' => 4}])
    result.should == {'a' => 1 ,'b' => 3, 'c' => 4}
  end

  it "should leave the argument untouched" do
    a = {'a' => 1 ,'b' => 2}
    result = @scope.function_hash_merge([{'a' => 1 ,'b' => 2},{'b' => 3, 'c' => 4}])
    a.should == {'a' => 1 ,'b' => 2}
  end

end
