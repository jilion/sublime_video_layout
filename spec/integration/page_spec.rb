require 'spec_helper'

describe 'root page' do
  it 'works' do
    visit '/'

    page.should have_content('Engine test!')
  end
end
