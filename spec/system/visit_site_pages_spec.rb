# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visit site pages', type: :system, js: true do
  before do
    stub_const('ENV', ENV.to_hash.merge('JOB_BOARD_PASSWORD' => 'testing'))
    stub_const('ENV', ENV.to_hash.merge('JWT_HMAC_SECRET' => 'testing1'))
  end
  it 'visits home page' do
    visit root_path
    expect(page).to have_text('A virtual community for women and non-binary Rubyists')
  end

  it 'visits sponsor us page' do
    visit sponsor_us_path
    expect(page).to have_text('Partner with Us')
  end
  it 'visits jobs page' do
    visit jobs_path

    expect(page).to have_text('The WNB.rb job board is password protected')
    expect(page).to have_current_path(jobs_authenticate_path)
    expect(page).to have_button('View Job Board')

    fill_in 'password', with: 'testing'

    click_on 'View Job Board'

    expect(page).to have_text('Jobs')
  end

  it 'visits join_us page' do
    visit join_us_path
    expect(page).to have_text('Join WNB.rb!')
  end

  it 'visits donate page' do
    visit donate_path
    expect(page).to have_text('Donate')
  end

  it 'visits meetups page' do
    visit meetups_path
    expect(page).to have_text('Meetups')
  end

  it 'visits past meetup today' do
    meetup = create(:event, date: Date.today - 30.days)

    visit "/meetups/#{meetup.date.year}/#{meetup.date.month}/#{meetup.date.day}"

    expect(page).to have_text(meetup.title)
  end
end
