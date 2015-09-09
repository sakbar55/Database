class Person
  attr_accessor :name,
  :phone,
  :address,
  :slack_account,
  :github_account
end

class Employee < Person
  attr_accessor :position,
  :salary,
  :date_hired,
  :name,
  :address,
  :slack_account,
  :github_account
end


class student < Person
