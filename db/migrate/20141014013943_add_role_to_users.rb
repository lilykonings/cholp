class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string

    User.create(:role => "administrator",
                :username => "pizpalue",
                :email => "ntuntasood@gmail.com",
                :password => "lordmasterandcommander",
                :password_confirmation => "lordmasterandcommander")
  end
end
