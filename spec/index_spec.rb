require '../index.rb'

describe 'check_name' do
    it 'gets a name between 1 and 10 characters' do
        expect(check_name('')).to eq(false)
        expect(check_name('Nick Cage')).to eq(true)
        expect(check_name('iejdfoiwejfoiwefowijfowijed')).to eq(false)
        expect(check_name('Kathryn')).to eq(true)
    end
end 