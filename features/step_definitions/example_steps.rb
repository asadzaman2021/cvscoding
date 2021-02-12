Given(/^I am on the homepage$/) do
  visit "/"
  expect(find('h1', :text => "Welcome to MyRapName.com"))
end

#TODO - Need more research to optimize the code to handle more rows
Then(/^I verify a new name has been prepended to the list in "(.*?)" row$/) do |text|
    if text.eql?('First')
      expect(find(:xpath, "//tr//td//div/h1").text.length != 0).to be true
    elsif text.eql?('Second')
        expect(find(:xpath, "//tr//td//div/h1/../../../..//tr[2]//td[@align='center']//div").text.length != 0).to be true
    elsif text.eql?('Third')
            expect(find(:xpath, "//tr//td//div/h1/../../../..//tr[3]//td[@align='center']//div").text.length != 0).to be true
    else
        assert('cannot find name to the list')
    end
end

When(/^I uncheck checkbox for "(.*?)"$/) do |field|
    if field.eql?('Nickname')
        uncheck('shorten')
    elsif field.eql?('something')
        #for future use
    else
        assert('checkbox is not found')
    end
end

When(/^I verify checkbox is checked for "(.*?)"$/) do |field|
    if field.eql?('Nickname')
        expect(page).to have_checked_field('shorten')
    elsif field.eql?('something')
        #for future use
    else
        assert('checkbox is not found')
    end
end

Then(/^I see the text "(.*?)" in a page$/) do |text|
    expect(find('h1', :text => text))
end

When(/^I click "(.*?)" button "(.*?)" (?:time|times)$/) do |field, number|
    for a in 1..number.to_i do
        if field.eql?('Suggest Male')
            find_button('Suggest Male Rap Name').click
        elsif field.eql?('Suggest Female')
            find_button('Suggest Female Rap Name').click
        else
            assert('cannot find field')
        end
    end
end

When(/^I enter "(.*?)" in the  "(.*?)" field$/) do |data, field|
    if field.eql?('Firstname')
        fill_in('firstname', :with => data)
    elsif field.eql?('Last Initial')
        fill_in('lastinitial', :with => data)
    else
        assert('cannot find field')
    end
end

When(/^I verify input field for "(.*?)" exists$/) do |locator|
    expect(page).to have_field(locator)
end

Then(/^I see the text "(.*?)"$/) do |text|
    expect(page).to have_content(text)
end

Then(/^I verify "(.*?)" input field only accepted alpha numeric value$/) do |field|
    fieldValue = find_field(field).value
    #verify field value is alpha numeric only
    expect(!fieldValue.match(/\A[a-zA-Z0-9]*\z/).nil?).to eq true
end
