require 'fast_spec_helper'
require File.expand_path('app/helpers/sublime_video_layout_helper')

describe SublimeVideoLayoutHelper do
  class Helper
    extend SublimeVideoLayoutHelper
  end

  describe ".custom_url" do
    let(:request) { stub(domain: 'example.com', ssl?: false, subdomain: '') }
    before do
      Helper.stub(:request) { request }
      Rails.stub(:env) { 'development' }
    end

    it "accepts custom subdomain" do
      Helper.custom_url('path', subdomain: 'my').should eq('http://my.example.com/path')
    end

    it "overwrites subdomain" do
      request.stub(subdomain: 'docs')
      Helper.custom_url('path', subdomain: 'my').should eq('http://my.example.com/path')
    end

    it "remove subdomain" do
      request.stub(subdomain: 'docs')
      Helper.custom_url('path', subdomain: false).should eq('http://example.com/path')
    end

    it "uses default subdomain" do
      request.stub(subdomain: 'docs')
      Helper.custom_url('path').should eq('http://docs.example.com/path')
    end

  end

end
