class Contact < ActiveRecord::Base
  validate :person_or_organization

  def person_or_organization
    if id > 3076 # Magic number.  This is the highest id before validation was created
      unless org_name || (first_name || last_name)
        errors.add(:org_name, "or first name or last name needs to be set.")
      end
    end
  end
end
