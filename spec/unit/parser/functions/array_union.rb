#! /usr/bin/env ruby

require File.dirname(__FILE__) + '/../../../spec_helper'

describe "the array_union function" do

  before :each do
    @scope = Puppet::Parser::Scope.new
  end

  it "should exist" do
    Puppet::Parser::Functions.function("array_union").should == "function_array_union"
  end

  it "should raise a ParseError if there is less than 2 arguments" do
    lambda { @scope.function_array_union([["foo"]]) }.should( raise_error(Puppet::ParseError))
  end

  it "should raise a ParseError if there is more than 2 arguments" do
    lambda { @scope.function_array_union([["foo", "bar", "gazonk"]]) }.should( raise_error(Puppet::ParseError))
  end

  it "should union to arrays" do
    result = @scope.function_array_union([['a','b'],['c']])
    result.should(eql(['a','b','c']))
  end

  it "should do nothing if an item is present" do
    result = @scope.function_array_union([['a','b'],['b']])
    result.should(eql(['a','b']))
  end

  it "should leave the argument untouched" do
    a = ['a','b']
    result = @scope.function_array_union([a,['c']])
    a.should(eql(['a','b']))
  end

end
