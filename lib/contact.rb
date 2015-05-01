class Contact

  @@contacts = []

  attr_reader(:last_name, :first_name, :birth_month, :addresses, :phone_nums)

  define_method(:initialize) do |last_name, first_name, birth_month|
    @first_name = first_name
    @last_name = last_name
    @birth_month = birth_month
    @id = @@contacts.length + 1
    @addresses = []
    @phone_nums = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id.to_i())
        found_contact = contact
      end
    end
    found_contact
  end
end
