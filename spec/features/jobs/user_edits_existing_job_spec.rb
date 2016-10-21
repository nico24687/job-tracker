require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Job Title", description: "Job Description", level_of_interest: 25)
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "New Title"
    click_button "Update"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{job.id}")
    expect(page).to have_content("New Title")
    expect(page).to_not have_content("Job Title")
  end
end
