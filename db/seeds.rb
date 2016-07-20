# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Sentence.delete_all

root1 = Sentence.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.sentence(20))
root2 = Sentence.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.sentence(20))
root3 = Sentence.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.sentence(20))

child1_root1 = Sentence.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.sentence(20))
child1_root1.move_to_child_of(root1)
child1_child1 = Sentence.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.sentence(20))
child1_child1.move_to_child_of(child1_root1)

child2_root2 = Sentence.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.sentence(20))
child2_root2.move_to_child_of(root2)
child2_child2 = Sentence.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.sentence(20))
child2_child2.move_to_child_of(child2_root2)

child3_root3 = Sentence.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.sentence(20))
child3_root3.move_to_child_of(root3)
child3_child3 = Sentence.create(title: Faker::Lorem.sentence(3), body: Faker::Lorem.sentence(20))
child3_child3.move_to_child_of(child3_root3)

root1.reload
root2.reload
root3.reload

Sentence.rebuild!