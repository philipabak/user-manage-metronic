# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( application.css )
Rails.application.config.assets.precompile += %w( application.js )

Rails.application.config.assets.precompile += %w( visitors.css users.css )
Rails.application.config.assets.precompile += %w( visitors.js users.js )

Rails.application.config.assets.precompile += %w( application.css components.css dataTables.bootstrap.css dataTables.scroller.min.css default.css font-awesome.min.css layout.css login-soft.css plugins.css select2.css uniform.default.css)
Rails.application.config.assets.precompile += %w( bootstrap.min.js dataTables.bootstrap.js dataTables.tableTools.min.js jquery.backstretch.min.js jquery.dataTables.min.js jquery.uniform.min.js jquery.validate.min.js jquery-1.11.0.min.js layout.js login-soft.js metronic.js quick-sidebar.js table-advanced.js)
