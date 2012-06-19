require 'fast_spec_helper'
require File.expand_path('app/helpers/sublime_video_layout_helper')

describe SublimeVideoLayoutHelper do
  class Helper
    extend SublimeVideoLayoutHelper
  end

  describe ".custom_url" do
    context 'normal domain' do
      let(:request) { stub(domain: 'example.com', ssl?: false, subdomain: '', port: nil) }
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

      it "keeps no subdomain" do
        Helper.custom_url('path', subdomain: false).should eq('http://example.com/path')
      end

      it "remove subdomain" do
        request.stub(subdomain: 'docs')
        Helper.custom_url('path', subdomain: false).should eq('http://example.com/path')
      end

      it "keeps no subdomain" do
        Helper.custom_url('path').should eq('http://example.com/path')
      end

      it "uses default subdomain" do
        request.stub(subdomain: 'docs')
        Helper.custom_url('path').should eq('http://docs.example.com/path')
      end

      it "keeps the current port" do
        request.stub(port: 3000)
        Helper.custom_url('path').should eq('http://example.com:3000/path')
      end

      it "doesn't keep the current port if Rails.env is production" do
        Rails.stub(:env) { 'production' }
        request.stub(port: 3000)
        Helper.custom_url('path').should eq('http://example.com/path')
      end
    end

    context 'xip.io domain' do
      let(:request) { stub(domain: 'xip.io', ssl?: false, subdomain: 'example.192.168.0.11', port: nil) }
      before do
        Helper.stub(:request) { request }
        Rails.stub(:env) { 'development' }
      end

      it "accepts custom subdomain" do
        Helper.custom_url('path', subdomain: 'my').should eq('http://my.example.192.168.0.11.xip.io/path')
      end

      it "overwrites subdomain" do
        request.stub(subdomain: 'docs.example.192.168.0.11')
        Helper.custom_url('path', subdomain: 'my').should eq('http://my.example.192.168.0.11.xip.io/path')
      end

      it "keeps no subdomain" do
        Helper.custom_url('path', subdomain: false).should eq('http://example.192.168.0.11.xip.io/path')
      end

      it "remove subdomain" do
        request.stub(subdomain: 'docs.example.192.168.0.11')
        Helper.custom_url('path', subdomain: false).should eq('http://example.192.168.0.11.xip.io/path')
      end

      it "keeps no subdomain" do
        Helper.custom_url('path').should eq('http://example.192.168.0.11.xip.io/path')
      end

      it "uses default subdomain" do
        request.stub(subdomain: 'docs.example.192.168.0.11')
        Helper.custom_url('path').should eq('http://docs.example.192.168.0.11.xip.io/path')
      end
    end
  end

  describe "sublimevideo_include_tag" do
    it { Helper.sublimevideo_include_tag(true, 'my').should eq %(<script src="https://4076.voxcdn.com/js/#{::SiteToken[:my]}.js" type="text/javascript"></script>) }
    it { Helper.sublimevideo_include_tag(false, :docs).should eq %(<script src="http://cdn.sublimevideo.net/js/#{::SiteToken[:docs]}.js" type="text/javascript"></script>) }
  end

end
