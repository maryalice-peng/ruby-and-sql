# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table

# companies =   company.all.count
puts "There are #{Company.all.count} companies"

new_company = Company.new
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://apple.com"
new_company.save
# puts new_company.inspect

puts "There are #{Company.all.count} companies"

new_company = Company.new
new_company["name"] = "Amazon"
new_company["city"] = "Seattle"
new_company["state"] = "WA"
new_company.save
# puts new_company.inspect

puts "There are #{Company.all.count} companies"

new_company = Company.new
new_company["name"] = "Google"
new_company["city"] = "Mountainview"
new_company["state"] = "CA"
new_company["url"] = "https://google.com"
new_company.save
# puts new_company.inspect

puts "There are #{Company.all.count} companies"


# 3. query companies table to find all row with California company

cali_companies = Company.where({"state" => "CA"})
# puts cali_companies.inspect

puts "California companies: #{cali_companies.count}"

# 4. query companies table to find single row for Apple

# apple = Company.where({"name" => "Apple"})
apple = Company.find_by({"name" => "Apple"})
puts apple.inspect
#if there are more than one rows named APple, then it'll only return the info for the first one, like an index 

# 5. read a row's column value
puts apple["url"]

# 6. update a row's column value
amazon = Company.find_by({"name" => "Amazon"})
# puts amazon.inspect
amazon["url"] = "https://amazon.com"
# puts amazon.inspect
# The above doesn't work for updating a row because it doesn't actually save it into the DB. Just temporarily returns the right answer in your terminal, but isn't a long-term fix 
amazon.save
# the .save is what will fix it 
puts amazon.inspect


# 7. delete a row
google = Company.find_by({"name" => "Google"})
google.destroy

puts "There are #{Company.all.count} companies"