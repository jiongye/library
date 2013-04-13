ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do


    div :id => 'admin' do

      div do
        link_to "Books", books_path
      end

      div do
        link_to 'Lendings', lendings_path
      end

    end

    # Here is an example of a simple dashboard with columns and panels.

    #columns do
      # column do
      #   panel "Recent Posts" do
      #     link_to "Books", books_path
      #   end
      # end

      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
    #end
  end # content
end
