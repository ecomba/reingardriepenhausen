Then /^I should see "([^"]*)" in the title$/ do |title|
  page.should have_css 'title', text: title
end

Then /^I should see "([^"]*)" in the header$/ do |title|
  page.should have_css 'header h1', text: title
end
