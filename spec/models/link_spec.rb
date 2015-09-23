require 'rails_helper'

describe Link do

  let(:link) { Link.create!(url: "https://www.google.com", status: 0) }

  xit { is_expected.to validate_presence_of(:url) }
  it { should belong_to(:user) }

  it "is invalid without a url" do
    link.url = ""
    expect(link).to_not be_valid
  end

  it "is valid without a status; defaults to unread" do
    link_2 = Link.create(url: "https://www.google.com")
    expect(link_2).to be_valid
    expect(link_2.status).to eq('unread')
  end

  describe 'status' do
    subject { Link.new }

    it { is_expected.to respond_to(:status) }

    describe ':unread' do
      it 'is the initial state' do
        expect(subject.unread?).to eql(true)
      end

      it 'can be transitioned to :read' do
        expect { subject.have_read }.to change(subject, :read?).from(false).to(true)
      end
    end

    describe ':read' do
      before { subject.status = :read }

      it 'can be transitioned back to :unread' do
        expect { subject.have_not_read }.to change(subject, :unread?).from(false).to(true)
      end
    end
  end
end
