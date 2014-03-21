require 'yaml/store'

Person = Struct.new :first_name, :last_name

people = [Person.new("Bob", "Smith"), Person.new("Mary", "Johnson")]

store = YAML::Store.new "test.store"

store.transaction do
  store["people"] = people
  store["greeting"] = { "hello" => "world" }
end