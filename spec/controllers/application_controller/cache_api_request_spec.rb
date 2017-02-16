require 'rails_helper'

class ApplicationController < ActionController::Base
  describe CacheApiRequest do
    describe '#call' do
      let(:api_request) { double('api_request') }
      let(:response) { 'response' }

      before(:example) do
        allow(api_request).to receive(:call).and_return(response)
      end

      context 'when unique key passed' do
        let(:unique_key) { 'key' }

        it 'returns cached response' do
          cached_responce = CacheApiRequest.new(api_request).call(unique_key)

          expect(cached_responce).to eq response
        end
      end

      context 'when unique key not passed' do
        it 'raises ArgumentError' do
          expect { CacheApiRequest.new(api_request).call }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
