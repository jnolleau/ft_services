<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// $minikube_ip = getenv('MINIKUBE_IP');

// /** Wp site URL*/
// define('WP_SITEURL','https://'.$minikube_ip.'/wordpress');
// define('WP_HOME', 'https://'.$minikube_ip.'/wordpress');
// define('WP_SITEURL','http://'.$minikube_ip.':5050');
// define('WP_HOME', 'http://'.$minikube_ip.':5050');

// if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') $_SERVER['HTTPS']='on';

// /** Fix to get the dashboard working with the reverse proxy.*/
// $_SERVER['REQUEST_URI'] = str_replace("/wp-admin/", ":5050/wp-admin/",  $_SERVER['REQUEST_URI']);

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pw' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );
/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '9L@hPFehy&CS0/EXX@1g6yi/zxQ4.hX3 ;q7@:@&dtLpt&3&WZP)F?c35f(v[+C6' );
define( 'SECURE_AUTH_KEY',  'CEo$*sCoS00uW}QQ#TOI#oz,#~L!6d9xk<2Unp..r{/Gbf(HH]vlQlylP1 P1s?3' );
define( 'LOGGED_IN_KEY',    'S$_(o>zxrvhe<_ezA^7vFx#}*l?([}?H`$!64R!+F(S*Q@9,g$/Tvw]gR;pjpfH.' );
define( 'NONCE_KEY',        'S[mBF@+%opc[XlTUgY<$MqdJ%nch$K&1-P N>|{/.`&n9C@`0s]!Q#{Q,vvb>(S;' );
define( 'AUTH_SALT',        'sp%u5WWkkwggkMa;{/,5Bhr-#Pt=+QB*28{8rbUD~ah&#9#%CWctZ+#~y0{ 2~8^' );
define( 'SECURE_AUTH_SALT', '>Be!tGP*&J}a;pR^^stQOY-t09@0> ,Lg42g4tz(kDNf4b)4^,*gc4jQ0owpUq(q' );
define( 'LOGGED_IN_SALT',   'H#AS*E=PP:iXJ:QZY+6K;;[62);$3=p3qE8pdAOz,>x)#t>bSQ9&2S_Sd&5iCP0M' );
define( 'NONCE_SALT',       '>ZryQ(BG`k93BG9RQ?o2L_W&k41nCJ/YJEY9(KEfj[ <F}I}>`]/ia6<e,g_pB1X' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
