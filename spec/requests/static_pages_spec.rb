require 'spec_helper'

describe "static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_title("Being Mindful") }
    it { should_not have_title("~ Home") }

    describe "for signed-in users" do
       let(:user) { FactoryGirl.create(:user) }
       before do 
        FactoryGirl.create(:post, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:post, user: user, content: "Another post")
        sign_in user 
        visit root_path
     end

     it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end 
  end

  describe 'Help page' do
    before { visit help_path }
    it { should have_content("Help") }    
    it { should have_title("Help") }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_content("About") }
    it { should have_title("About") }
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_content("Contact") }
    it { should have_title("Contact") }
  end

  it "should have the correct links on the navbar" do
    visit root_path
    click_link "Home"
    expect(page).to have_title("Being Mindful")
    click_link "About"
    expect(page).to have_title(full_title("About"))
    click_link "Contact"
    expect(page).to have_title(full_title("Contact"))
    click_link "Help"
    expect(page).to have_title(full_title("Help"))  
  end

end


