namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_relationships
  end
end

def make_users
    admin = User.create!(name: "Colin Stodd",
                 email: "cbstodd@beingmindful.com",
                 password: "Damntone8",
                 password_confirmation: "Damntone8",
                 admin: true)    
    admin2 = User.create!(name: "Alex Bland",
                 email: "bland.alexandra@beingmindful.com",
                 password: "BeingBland",
                 password_confirmation: "BeingBland",
                 admin: true)

  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@beingmindful.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end



def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end