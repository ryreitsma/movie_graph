neo4j_config = Rails.application.config_for(:neo4j)

Rails.application.config.neo4j.session_options = { basic_auth: { username: neo4j_config['username'], password: neo4j_config['password']} }
Rails.application.config.neo4j.session_type = :server_db
Rails.application.config.neo4j.session_path = "#{neo4j_config['host']}:#{neo4j_config['port']}"