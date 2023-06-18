source .env

cat > ./www/app/etc/env.php <<EOF
<?php
return [
    'backend' => [
        'frontName' => 'admin'
    ],
    'queue' => [
        'consumers_wait_for_messages' => 1
    ],
    'crypt' => [
        'key' => 'a19ce2acd506d870d2037d8b80389c39'
    ],
    'db' => [
        'table_prefix' => '',
        'connection' => [
            'default' => [
                'host' => "${MARIADB_HOST}",
                'dbname' => "${MARIADB_DATABASE}",
                'username' => "${MARIADB_ROOT_USER}",
                'password' => "${MARIADB_ROOT_PASSWORD}",
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;',
                'active' => '1',
                'driver_options' => [
                    1014 => false
                ]
            ]
        ]
    ],
    'resource' => [
        'default_setup' => [
            'connection' => 'default'
        ]
    ],
    'x-frame-options' => 'SAMEORIGIN',
    'MAGE_MODE' => 'developer',
    'session' => [
        'save' => 'db'
    ],
    'cache' => [
        'frontend' => [
            'default' => [
                'id_prefix' => '69d_'
            ],
            'page_cache' => [
                'id_prefix' => '69d_'
            ]
        ],
        'allow_parallel_generation' => false
    ],
    'lock' => [
        'provider' => 'db',
        'config' => [
            'prefix' => ''
        ]
    ],
    'directories' => [
        'document_root_is_pub' => false
    ],
    'cache_types' => [
        'config' => 1,
        'layout' => 1,
        'block_html' => 1,
        'collections' => 1,
        'reflection' => 1,
        'db_ddl' => 1,
        'compiled_config' => 1,
        'eav' => 1,
        'customer_notification' => 1,
        'config_integration' => 1,
        'config_integration_api' => 1,
        'full_page' => 1,
        'config_webservice' => 1,
        'translate' => 1,
        'vertex' => 1,
        'ec_cache' => 1,
        'epost_data' => 1
    ],
    'system' => [
        'default' => [
            'web' => [
                'unsecure' => [
                    'base_url' => "${PROJECT_US_URL}",
                    'base_link_url' => '{{unsecure_base_url}}'
                ],
                'secure' => [
                    'base_url' => "${PROJECT_S_URL}",
                    'base_link_url' => '{{secure_base_url}}'
                ],
                'default' => [
                    'front' => 'cms'
                ]
            ],
            'catalog' => [
                'search' => [
                    'engine' => 'elasticsearch7',
                    'elasticsearch7_server_hostname' => "${ELASTICSEARCH_HOST}",
                    'elasticsearch7_server_port' => '9200',
                    'elasticsearch7_server_timeout' => 15,
                    'elasticsearch7_index_prefix' => 'magento2'
                ]
            ]
        ]
    ],
    'http_cache_hosts' => [
        [
            'host' => '127.0.0.1',
            'port' => '6081'
        ]
    ]
];
EOF

echo "env.php file generated successfully!"