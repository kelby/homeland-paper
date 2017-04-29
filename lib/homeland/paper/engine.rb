module Homeland
  module Paper
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Paper

      initializer 'homeland.paper.init' do |app|
        if defined?(Setting) && Setting.has_module?(:paper)
          Homeland.register_plugin do |plugin|
            plugin.name              = 'paper'
            plugin.display_name      = '资料'
            plugin.description       = Homeland::Wiki::DESCRIPTION
            plugin.version           = Homeland::Wiki::VERSION
            plugin.navbar_link       = true
            plugin.user_menu_link    = false
            plugin.root_path         = "/papers"
            plugin.admin_path        = "/admin/papers"
            plugin.admin_navbar_link = true
            plugin.spec_path         = config.root.join('spec')
          end

          app.routes.prepend do
            mount Homeland::Wiki::Engine, at: '/'
          end

          app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
        end
      end
    end
  end
end
