# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies' do
  describe '#index' do
    context 'without any movies' do
      it 'renders empty response' do
        get '/v1/movies'
        expect(JSON.parse(body)).to be_empty
      end
    end
  end
end
