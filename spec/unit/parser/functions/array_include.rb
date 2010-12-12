#! /usr/bin/env ruby

require File.dirname(__FILE__) + '/../../../spec_helper'

describe "the array_include function" do

  before :each do
    @scope = Puppet::Parser::Scope.new
  end

  it "should exist" do
    Puppet::Parser::Functions.function("array_include").should == "function_array_include"
  end

  it "should raise a ParseError if there is less than 2 arguments" do
    lambda { @scope.function_array_include(["foo"]) }.should( raise_error(Puppet::ParseError))
  end

  it "should raise a ParseError if there is more than 2 arguments" do
    lambda { @scope.function_array_include(["foo", "bar", "gazonk"]) }.should( raise_error(Puppet::ParseError))
  end

  it "should return true if an item is present in the array" do
    result = @scope.function_array_include(['a','b'],'b')
    result.should == true
  end

  it "should return false if an item is not present" do
    result = @scope.function_array_include(['a','b'],'c')
    result.should == false
  end

end
