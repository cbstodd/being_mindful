namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_relationships
  end
end

def make_users
    admin = User.create!(name: "Colin Stodd",
                 email: "cbstodd@gmail.com",
                 password: "Damntone8",
                 password_confirmation: "Damntone8",
                 admin: true)    
    admin2 = User.create!(name: "Alex Bland",
                 email: "bland.alexandra@gmail.com",
                 password: "BeingBland",
                 password_confirmation: "BeingBland",
                 admin: true)
end



def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end