#This is just a test to make sure rspec is set up correctly and will be removed in the final product
require '../rspec_test.rb'

describe 'rspec_test.rb - hello' do
    it 'says hello' do
        expect(say_hello()).to eq('hello')
    end
end 