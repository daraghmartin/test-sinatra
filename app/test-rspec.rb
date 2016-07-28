require 'json'

ENV['RACK_ENV'] = 'test'
environment = 'test'
name = 'daragh'
ENV['ENVIRONMENT'] = environment

require_relative 'app'
require 'rspec'
require 'rack/test'

describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Hello World  - @environmet: #{environment}")
  end
 
  it "says hello to #{name}" do
    get "/?name=#{name}"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Hello World #{name} - @environmet: #{environment}")
  end

  it "returns an api response" do
    get '/api/hello/', format: :json
    expect(last_response).to be_ok
  end

  it "gets valid json from api" do
    get '/api/hello/', format: :json
    json = JSON.parse(last_response.body)
    expect(json['hello']).to eq('world')
    expect(last_response).to be_ok
  end

end
