<?php
// ** FILE MANAGED BY PUPPET ** //
 
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', '<%= scope.lookupvar('jboss::db_name') %>');

/** MySQL database username */
define('DB_USER', '<%= scope.lookupvar('jboss::db_user') %>');

/** MySQL database password */
define('DB_PASSWORD', '<%= scope.lookupvar('jboss::db_password') %>');

/** MySQL hostname */
define('DB_HOST', '<%= scope.lookupvar('jboss::db_host') %>');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.jboss.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 */
define('AUTH_KEY',         'bCRmW?MJmD-Hr*GNG&uYVM4#1iw &Aw@e;t3oh`n@%2tdYJOtmwfjWB t,r| ~c}');
define('SECURE_AUTH_KEY',  'L4Vw~c3v-%ZYrs*6eg2Uo4f@sSSx@E*`_T>`|{CW(IBaac>z|V|3`&0jM7C,Ayh|');
define('LOGGED_IN_KEY',    '^]:gvaN]7u1|d{[5dTSbR]#`<jfaw@55orhn1|t sYUOkKz?eeRjzqbqqxZ+[5-S');
define('NONCE_KEY',        'pabspCXe{8N$8$DzXt5x:1ixu`~i@DUhV%dtWJf(HIb>_VZgOZO5A_|hB^U~bEjk');
define('AUTH_SALT',        '*C %J}FwOlx%LRM3Ba9d4K2nUm@kc9`@&`*l-m]|0Ie&((1J+@?NQVW(8}&Ul%5T');
define('SECURE_AUTH_SALT', '3h52b qq~T@|{^J/AmT1R~;OHyYSn5eEKbe,^okH3greV2^8.%Bv.kSO]4s0I4eG');
define('LOGGED_IN_SALT',   '`*j$)n?@#*q|I:2V&3(*VOO*6S#Da/F*jfsk:Dy2jVV1r0pD<btT,DnmwHa2 G^S');
define('NONCE_SALT',       '1iGnR<K|11JNmUG_H SLu6D T6~IA`Id<O7U7:3z9S<iHZo:+zU[bi~%Q$b+$}qN');

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
