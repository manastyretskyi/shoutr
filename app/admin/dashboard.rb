ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Shouts" do
          table_for Shout.all.order(created_at: :desc).limit(20).map do
            column("Shouts") { |shout| render shout }
            column("Actions") do |shout| 
              link_to("View", admin_shout_path(shout)) + " " +
              link_to("Edit", edit_admin_shout_path(shout)) + " " +
              link_to("Delete", admin_shout_path(shout), method: :delete)
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end
end
