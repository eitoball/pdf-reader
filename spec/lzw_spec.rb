# coding: utf-8

require File.dirname(__FILE__) + "/spec_helper"

describe PDF::Reader::LZW do
  it "should correctly decode a lzw compress string" do
    content = %w{ 80 0B 60 50 22 0C 0C 85 01 }.map { |byte|
      byte.to_i(16)
    }.pack("C*")

    PDF::Reader::LZW.decode(content).should == '-----A---B'
  end

  it "should correctly decode another lzw compressed string" do
    content = binread(File.dirname(__FILE__) + "/data/lzw_compressed2.dat")

    PDF::Reader::LZW.decode(content).should match(/\ABT/)
  end
end
