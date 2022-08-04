# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_04_022534) do

  create_table "columns_priv", primary_key: ["Host", "User", "Db", "Table_name", "Column_name"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "Column privileges", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Table_name", limit: 64, default: "", null: false
    t.string "Column_name", limit: 64, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.column "Column_priv", "set('Select','Insert','Update','References')", default: "", null: false, collation: "utf8mb3_general_ci"
  end

  create_table "component", primary_key: "component_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", comment: "Components", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "component_group_id", null: false, unsigned: true
    t.text "component_urn", null: false
  end

  create_table "db", primary_key: ["Host", "User", "Db"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "Database privileges", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.column "Select_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Insert_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Update_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Delete_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Drop_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Grant_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "References_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Index_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Alter_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_tmp_table_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Lock_tables_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Show_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Alter_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Execute_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Event_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Trigger_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.index ["User"], name: "User"
  end

  create_table "default_roles", primary_key: ["HOST", "USER", "DEFAULT_ROLE_HOST", "DEFAULT_ROLE_USER"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "Default roles", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "HOST", default: "", null: false, collation: "ascii_general_ci"
    t.string "USER", limit: 32, default: "", null: false
    t.string "DEFAULT_ROLE_HOST", default: "%", null: false, collation: "ascii_general_ci"
    t.string "DEFAULT_ROLE_USER", limit: 32, default: "", null: false
  end

  create_table "engine_cost", primary_key: ["cost_name", "engine_name", "device_type"], charset: "utf8mb3", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "engine_name", limit: 64, null: false
    t.integer "device_type", null: false
    t.string "cost_name", limit: 64, null: false
    t.float "cost_value"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "comment", limit: 1024
    t.virtual "default_value", type: :float, as: "(case `cost_name` when _utf8mb4'io_block_read_cost' then 1.0 when _utf8mb4'memory_block_read_cost' then 0.25 else NULL end)"
  end

  create_table "func", primary_key: "name", id: { type: :string, limit: 64, default: "" }, charset: "utf8mb3", collation: "utf8mb3_bin", comment: "User defined functions", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "ret", limit: 1, default: 0, null: false
    t.string "dl", limit: 128, default: "", null: false
    t.column "type", "enum('function','aggregate')", null: false, collation: "utf8mb3_general_ci"
  end

  create_table "general_log", id: false, charset: "utf8mb3", comment: "General log", options: "ENGINE=CSV", force: :cascade do |t|
    t.timestamp "event_time", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "user_host", size: :medium, null: false
    t.bigint "thread_id", null: false, unsigned: true
    t.integer "server_id", null: false, unsigned: true
    t.string "command_type", limit: 64, null: false
    t.binary "argument", size: :medium, null: false
  end

  create_table "global_grants", primary_key: ["USER", "HOST", "PRIV"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "Extended global grants", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "USER", limit: 32, default: "", null: false
    t.string "HOST", default: "", null: false, collation: "ascii_general_ci"
    t.string "PRIV", limit: 32, default: "", null: false, collation: "utf8mb3_general_ci"
    t.column "WITH_GRANT_OPTION", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
  end

  create_table "gtid_executed", primary_key: ["source_uuid", "interval_start"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "source_uuid", limit: 36, null: false, comment: "uuid of the source where the transaction was originally executed."
    t.bigint "interval_start", null: false, comment: "First number of interval."
    t.bigint "interval_end", null: false, comment: "Last number of interval."
  end

  create_table "help_category", primary_key: "help_category_id", id: { type: :integer, limit: 2, unsigned: true, default: nil }, charset: "utf8mb3", comment: "help categories", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.integer "parent_category_id", limit: 2, unsigned: true
    t.text "url", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "help_keyword", primary_key: "help_keyword_id", id: { type: :integer, unsigned: true, default: nil }, charset: "utf8mb3", comment: "help keywords", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "help_relation", primary_key: ["help_keyword_id", "help_topic_id"], charset: "utf8mb3", comment: "keyword-topic relation", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "help_topic_id", null: false, unsigned: true
    t.integer "help_keyword_id", null: false, unsigned: true
  end

  create_table "help_topic", primary_key: "help_topic_id", id: { type: :integer, unsigned: true, default: nil }, charset: "utf8mb3", comment: "help topics", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.integer "help_category_id", limit: 2, null: false, unsigned: true
    t.text "description", null: false
    t.text "example", null: false
    t.text "url", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "innodb_index_stats", primary_key: ["database_name", "table_name", "index_name", "stat_name"], charset: "utf8mb3", collation: "utf8mb3_bin", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "database_name", limit: 64, null: false
    t.string "table_name", limit: 199, null: false
    t.string "index_name", limit: 64, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "stat_name", limit: 64, null: false
    t.bigint "stat_value", null: false, unsigned: true
    t.bigint "sample_size", unsigned: true
    t.string "stat_description", limit: 1024, null: false
  end

  create_table "innodb_table_stats", primary_key: ["database_name", "table_name"], charset: "utf8mb3", collation: "utf8mb3_bin", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "database_name", limit: 64, null: false
    t.string "table_name", limit: 199, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "n_rows", null: false, unsigned: true
    t.bigint "clustered_index_size", null: false, unsigned: true
    t.bigint "sum_of_other_index_sizes", null: false, unsigned: true
  end

  create_table "password_history", primary_key: ["Host", "User", "Password_timestamp"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "Password history for user accounts", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "User", limit: 32, default: "", null: false
    t.timestamp "Password_timestamp", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "Password"
  end

  create_table "plugin", primary_key: "name", id: { type: :string, limit: 64, default: "" }, charset: "utf8mb3", comment: "MySQL plugins", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "dl", limit: 128, default: "", null: false
  end

  create_table "procs_priv", primary_key: ["Host", "User", "Db", "Routine_name", "Routine_type"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "Procedure privileges", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Routine_name", limit: 64, default: "", null: false, collation: "utf8mb3_general_ci"
    t.column "Routine_type", "enum('FUNCTION','PROCEDURE')", null: false
    t.string "Grantor", limit: 288, default: "", null: false
    t.column "Proc_priv", "set('Execute','Alter Routine','Grant')", default: "", null: false, collation: "utf8mb3_general_ci"
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "proxies_priv", primary_key: ["Host", "User", "Proxied_host", "Proxied_user"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "User proxy privileges", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "User", limit: 32, default: "", null: false
    t.string "Proxied_host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Proxied_user", limit: 32, default: "", null: false
    t.boolean "With_grant", default: false, null: false
    t.string "Grantor", limit: 288, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "replication_asynchronous_connection_failover", primary_key: ["Channel_name", "Host", "Port", "Network_namespace", "Managed_name"], charset: "utf8mb3", comment: "The source configuration details", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Channel_name", limit: 64, null: false, comment: "The replication channel name that connects source and replica."
    t.string "Host", null: false, collation: "ascii_general_ci", comment: "The source hostname that the replica will attempt to switch over the replication connection to in case of a failure."
    t.integer "Port", null: false, comment: "The source port that the replica will attempt to switch over the replication connection to in case of a failure.", unsigned: true
    t.string "Network_namespace", limit: 64, null: false, comment: "The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace."
    t.integer "Weight", limit: 1, null: false, comment: "The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.", unsigned: true
    t.string "Managed_name", limit: 64, default: "", null: false, comment: "The name of the group which this server belongs to."
    t.index ["Channel_name", "Managed_name"], name: "Channel_name"
  end

  create_table "replication_asynchronous_connection_failover_managed", primary_key: ["Channel_name", "Managed_name"], charset: "utf8mb3", comment: "The managed source configuration details", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Channel_name", limit: 64, null: false, comment: "The replication channel name that connects source and replica."
    t.string "Managed_name", limit: 64, default: "", null: false, comment: "The name of the source which needs to be managed."
    t.string "Managed_type", limit: 64, default: "", null: false, comment: "Determines the managed type."
    t.json "Configuration", comment: "The data to help manage group. For Managed_type = GroupReplication, Configuration value should contain {\"Primary_weight\": 80, \"Secondary_weight\": 60}, so that it assigns weight=80 to PRIMARY of the group, and weight=60 for rest of the members in mysql.replication_asynchronous_connection_failover table."
  end

  create_table "replication_group_configuration_version", primary_key: "name", id: { type: :string, collation: "ascii_general_ci", comment: "The configuration name." }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", comment: "The group configuration version.", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "version", null: false, comment: "The version of the configuration name.", unsigned: true
  end

  create_table "replication_group_member_actions", primary_key: ["name", "event"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", comment: "The member actions configuration.", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false, collation: "ascii_general_ci", comment: "The action name."
    t.string "event", limit: 64, null: false, collation: "ascii_general_ci", comment: "The event that will trigger the action."
    t.boolean "enabled", null: false, comment: "Whether the action is enabled."
    t.string "type", limit: 64, null: false, collation: "ascii_general_ci", comment: "The action type."
    t.integer "priority", limit: 1, null: false, comment: "The order on which the action will be run, value between 1 and 100, lower values first.", unsigned: true
    t.string "error_handling", limit: 64, null: false, collation: "ascii_general_ci", comment: "On errors during the action will be handled: IGNORE, CRITICAL."
    t.index ["event"], name: "event"
  end

  create_table "role_edges", primary_key: ["FROM_HOST", "FROM_USER", "TO_HOST", "TO_USER"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "Role hierarchy and role grants", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "FROM_HOST", default: "", null: false, collation: "ascii_general_ci"
    t.string "FROM_USER", limit: 32, default: "", null: false
    t.string "TO_HOST", default: "", null: false, collation: "ascii_general_ci"
    t.string "TO_USER", limit: 32, default: "", null: false
    t.column "WITH_ADMIN_OPTION", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
  end

  create_table "server_cost", primary_key: "cost_name", id: { type: :string, limit: 64 }, charset: "utf8mb3", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.float "cost_value"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "comment", limit: 1024
    t.virtual "default_value", type: :float, as: "(case `cost_name` when _utf8mb4'disk_temptable_create_cost' then 20.0 when _utf8mb4'disk_temptable_row_cost' then 0.5 when _utf8mb4'key_compare_cost' then 0.05 when _utf8mb4'memory_temptable_create_cost' then 1.0 when _utf8mb4'memory_temptable_row_cost' then 0.1 when _utf8mb4'row_evaluate_cost' then 0.1 else NULL end)"
  end

  create_table "servers", primary_key: "Server_name", id: { type: :string, limit: 64, default: "" }, charset: "utf8mb3", comment: "MySQL Foreign Servers table", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "Username", limit: 64, default: "", null: false
    t.string "Password", limit: 64, default: "", null: false
    t.integer "Port", default: 0, null: false
    t.string "Socket", limit: 64, default: "", null: false
    t.string "Wrapper", limit: 64, default: "", null: false
    t.string "Owner", limit: 64, default: "", null: false
  end

  create_table "slave_master_info", primary_key: "Channel_name", id: { type: :string, limit: 64, comment: "The channel on which the replica is connected to a source. Used in Multisource Replication" }, charset: "utf8mb3", comment: "Master Information", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "Number_of_lines", null: false, comment: "Number of lines in the file.", unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8mb3_bin", comment: "The name of the master binary log currently being read from the master."
    t.bigint "Master_log_pos", null: false, comment: "The master log position of the last read event.", unsigned: true
    t.string "Host", collation: "ascii_general_ci", comment: "The host name of the source."
    t.text "User_name", collation: "utf8mb3_bin", comment: "The user name used to connect to the master."
    t.text "User_password", collation: "utf8mb3_bin", comment: "The password used to connect to the master."
    t.integer "Port", null: false, comment: "The network port used to connect to the master.", unsigned: true
    t.integer "Connect_retry", null: false, comment: "The period (in seconds) that the slave will wait before trying to reconnect to the master.", unsigned: true
    t.boolean "Enabled_ssl", null: false, comment: "Indicates whether the server supports SSL connections."
    t.text "Ssl_ca", collation: "utf8mb3_bin", comment: "The file used for the Certificate Authority (CA) certificate."
    t.text "Ssl_capath", collation: "utf8mb3_bin", comment: "The path to the Certificate Authority (CA) certificates."
    t.text "Ssl_cert", collation: "utf8mb3_bin", comment: "The name of the SSL certificate file."
    t.text "Ssl_cipher", collation: "utf8mb3_bin", comment: "The name of the cipher in use for the SSL connection."
    t.text "Ssl_key", collation: "utf8mb3_bin", comment: "The name of the SSL key file."
    t.boolean "Ssl_verify_server_cert", null: false, comment: "Whether to verify the server certificate."
    t.float "Heartbeat", null: false
    t.text "Bind", collation: "utf8mb3_bin", comment: "Displays which interface is employed when connecting to the MySQL server"
    t.text "Ignored_server_ids", collation: "utf8mb3_bin", comment: "The number of server IDs to be ignored, followed by the actual server IDs"
    t.text "Uuid", collation: "utf8mb3_bin", comment: "The master server uuid."
    t.bigint "Retry_count", null: false, comment: "Number of reconnect attempts, to the master, before giving up.", unsigned: true
    t.text "Ssl_crl", collation: "utf8mb3_bin", comment: "The file used for the Certificate Revocation List (CRL)"
    t.text "Ssl_crlpath", collation: "utf8mb3_bin", comment: "The path used for Certificate Revocation List (CRL) files"
    t.boolean "Enabled_auto_position", null: false, comment: "Indicates whether GTIDs will be used to retrieve events from the master."
    t.text "Tls_version", collation: "utf8mb3_bin", comment: "Tls version"
    t.text "Public_key_path", collation: "utf8mb3_bin", comment: "The file containing public key of master server."
    t.boolean "Get_public_key", null: false, comment: "Preference to get public key from master."
    t.text "Network_namespace", collation: "utf8mb3_bin", comment: "Network namespace used for communication with the master server."
    t.string "Master_compression_algorithm", limit: 64, null: false, collation: "utf8mb3_bin", comment: "Compression algorithm supported for data transfer between source and replica."
    t.integer "Master_zstd_compression_level", null: false, comment: "Compression level associated with zstd compression algorithm.", unsigned: true
    t.text "Tls_ciphersuites", collation: "utf8mb3_bin", comment: "Ciphersuites used for TLS 1.3 communication with the master server."
    t.boolean "Source_connection_auto_failover", default: false, null: false, comment: "Indicates whether the channel connection failover is enabled."
    t.boolean "Gtid_only", default: false, null: false, comment: "Indicates if this channel only uses GTIDs and does not persist positions."
  end

  create_table "slave_relay_log_info", primary_key: "Channel_name", id: { type: :string, limit: 64, comment: "The channel on which the replica is connected to a source. Used in Multisource Replication" }, charset: "utf8mb3", comment: "Relay Log Information", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "Number_of_lines", null: false, comment: "Number of lines in the file or rows in the table. Used to version table definitions.", unsigned: true
    t.text "Relay_log_name", collation: "utf8mb3_bin", comment: "The name of the current relay log file."
    t.bigint "Relay_log_pos", comment: "The relay log position of the last executed event.", unsigned: true
    t.text "Master_log_name", collation: "utf8mb3_bin", comment: "The name of the master binary log file from which the events in the relay log file were read."
    t.bigint "Master_log_pos", comment: "The master log position of the last executed event.", unsigned: true
    t.integer "Sql_delay", comment: "The number of seconds that the slave must lag behind the master."
    t.integer "Number_of_workers", unsigned: true
    t.integer "Id", comment: "Internal Id that uniquely identifies this record.", unsigned: true
    t.string "Privilege_checks_username", limit: 32, collation: "utf8mb3_bin", comment: "Username part of PRIVILEGE_CHECKS_USER."
    t.string "Privilege_checks_hostname", collation: "ascii_general_ci", comment: "Hostname part of PRIVILEGE_CHECKS_USER."
    t.boolean "Require_row_format", null: false, comment: "Indicates whether the channel shall only accept row based events."
    t.column "Require_table_primary_key_check", "enum('STREAM','ON','OFF')", default: "STREAM", null: false, comment: "Indicates what is the channel policy regarding tables having primary keys on create and alter table queries"
    t.column "Assign_gtids_to_anonymous_transactions_type", "enum('OFF','LOCAL','UUID')", default: "OFF", null: false, comment: "Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value"
    t.text "Assign_gtids_to_anonymous_transactions_value", collation: "utf8mb3_bin", comment: "Indicates the UUID used while generating GTIDs for anonymous transactions"
  end

  create_table "slave_worker_info", primary_key: ["Channel_name", "Id"], charset: "utf8mb3", comment: "Worker Information", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "Id", null: false, unsigned: true
    t.text "Relay_log_name", null: false, collation: "utf8mb3_bin"
    t.bigint "Relay_log_pos", null: false, unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8mb3_bin"
    t.bigint "Master_log_pos", null: false, unsigned: true
    t.text "Checkpoint_relay_log_name", null: false, collation: "utf8mb3_bin"
    t.bigint "Checkpoint_relay_log_pos", null: false, unsigned: true
    t.text "Checkpoint_master_log_name", null: false, collation: "utf8mb3_bin"
    t.bigint "Checkpoint_master_log_pos", null: false, unsigned: true
    t.integer "Checkpoint_seqno", null: false, unsigned: true
    t.integer "Checkpoint_group_size", null: false, unsigned: true
    t.binary "Checkpoint_group_bitmap", null: false
    t.string "Channel_name", limit: 64, null: false, comment: "The channel on which the replica is connected to a source. Used in Multisource Replication"
  end

  create_table "slow_log", id: false, charset: "utf8mb3", comment: "Slow log", options: "ENGINE=CSV", force: :cascade do |t|
    t.timestamp "start_time", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "user_host", size: :medium, null: false
    t.time "query_time", precision: 6, null: false
    t.time "lock_time", precision: 6, null: false
    t.integer "rows_sent", null: false
    t.integer "rows_examined", null: false
    t.string "db", limit: 512, null: false
    t.integer "last_insert_id", null: false
    t.integer "insert_id", null: false
    t.integer "server_id", null: false, unsigned: true
    t.binary "sql_text", size: :medium, null: false
    t.bigint "thread_id", null: false, unsigned: true
  end

  create_table "tables_priv", primary_key: ["Host", "User", "Db", "Table_name"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "Table privileges", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Table_name", limit: 64, default: "", null: false
    t.string "Grantor", limit: 288, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.column "Table_priv", "set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger')", default: "", null: false, collation: "utf8mb3_general_ci"
    t.column "Column_priv", "set('Select','Insert','Update','References')", default: "", null: false, collation: "utf8mb3_general_ci"
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "time_zone", primary_key: "Time_zone_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", comment: "Time zones", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.column "Use_leap_seconds", "enum('Y','N')", default: "N", null: false
  end

  create_table "time_zone_leap_second", primary_key: "Transition_time", id: :bigint, default: nil, charset: "utf8mb3", comment: "Leap seconds information for time zones", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "Correction", null: false
  end

  create_table "time_zone_name", primary_key: "Name", id: { type: :string, limit: 64 }, charset: "utf8mb3", comment: "Time zone names", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
  end

  create_table "time_zone_transition", primary_key: ["Time_zone_id", "Transition_time"], charset: "utf8mb3", comment: "Time zone transitions", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
    t.bigint "Transition_time", null: false
    t.integer "Transition_type_id", null: false, unsigned: true
  end

  create_table "time_zone_transition_type", primary_key: ["Time_zone_id", "Transition_type_id"], charset: "utf8mb3", comment: "Time zone transition types", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
    t.integer "Transition_type_id", null: false, unsigned: true
    t.integer "Offset", default: 0, null: false
    t.integer "Is_DST", limit: 1, default: 0, null: false, unsigned: true
    t.string "Abbreviation", limit: 8, default: "", null: false
  end

  create_table "user", primary_key: ["Host", "User"], charset: "utf8mb3", collation: "utf8mb3_bin", comment: "Users and global privileges", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "User", limit: 32, default: "", null: false
    t.column "Select_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Insert_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Update_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Delete_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Drop_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Reload_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Shutdown_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Process_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "File_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Grant_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "References_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Index_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Alter_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Show_db_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Super_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_tmp_table_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Lock_tables_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Execute_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Repl_slave_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Repl_client_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Show_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Alter_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_user_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Event_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Trigger_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_tablespace_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "ssl_type", "enum('','ANY','X509','SPECIFIED')", default: "", null: false, collation: "utf8mb3_general_ci"
    t.binary "ssl_cipher", null: false
    t.binary "x509_issuer", null: false
    t.binary "x509_subject", null: false
    t.integer "max_questions", default: 0, null: false, unsigned: true
    t.integer "max_updates", default: 0, null: false, unsigned: true
    t.integer "max_connections", default: 0, null: false, unsigned: true
    t.integer "max_user_connections", default: 0, null: false, unsigned: true
    t.string "plugin", limit: 64, default: "caching_sha2_password", null: false
    t.text "authentication_string"
    t.column "password_expired", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.timestamp "password_last_changed"
    t.integer "password_lifetime", limit: 2, unsigned: true
    t.column "account_locked", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Create_role_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.column "Drop_role_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8mb3_general_ci"
    t.integer "Password_reuse_history", limit: 2, unsigned: true
    t.integer "Password_reuse_time", limit: 2, unsigned: true
    t.column "Password_require_current", "enum('N','Y')", collation: "utf8mb3_general_ci"
    t.json "User_attributes"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
