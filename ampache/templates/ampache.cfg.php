;#<?php exit(); ?>##
;###################
; General Config   #
;###################

; This value is used to detect quickly
; if this config file is up to date 
; this is compared against a value hard-coded
; into the init script
config_version = 11

;###################
; Path Vars        #
;###################

; The path to your ampache install
; Do not put a trailing / on this path 
; For example if your site is located at http://localhost
; than you do not need to enter anything for the web_path
; if it is located at http://localhost/music you need to 
; set web_path to /music
; DEFAULT: ""
web_path = "/ampache"

;##############################
; Session and Login Variables #
;##############################

; Hostname of your Database
; DEFAULT: localhost
database_hostname = "localhost"

; Name of your ampache database
; DEFAULT: ampache
database_name = "ampache"

; Username for your ampache database
; DEFAULT: ""
database_username = "ampache"

; Password for your ampache database, this can not be blank
; this is a 'forced' security precaution, the default value
; will not work
; DEFAULT: ""
database_password = "<%= db_pass %>"

; Length that a session will last expressed in seconds. Default is
; one hour. 
; DEFAULT: 3600
session_length = 3600

; Length that the session for a single streaming instance will last
; the default is two hours. With some clients, and long songs this can 
; cause playback to stop, increase this value if you experience that
; DEFAULT: 7200
stream_length = 7200

; This length defines how long a 'remember me' session and cookie will 
; last, the default is 7200, same as length. It is up to the administrator
; of the box to increase this, for reference 86400 = 1 day 
; 604800 = 1 week and 2419200 = 1 month
; DEFAULT: 86400
remember_length = 86400

; Name of the Session/Cookie that will sent to the browser
; default should be fine
; DEFAULT: ampache
session_name = ampache

; Lifetime of the Cookie, 0 == Forever (until browser close) , otherwise in terms of seconds
; If you want cookies to last past a browser close set this to a value in seconds. 
; DEFAULT: 0
session_cookielife = 0

; Is the cookie a "secure" cookie? This should only be set to 1 (true) if you are
; running a secure site (HTTPS). 
; DEFAULT: 0
session_cookiesecure       = 0

; Auth Methods 
; This defines which auth methods vauth will attempt
; to use and in which order, if auto_create isn't enabled
; The user must exist locally. Local method uses PHP's PAM Auth module
; DEFAULT: mysql
; VALUES: mysql,ldap,http,local
auth_methods = "mysql"

; Logout redirection target
; Defaults to our own login.php, but we can override it here if, for instance, 
; we want to redirect to an SSO provider instead.
; logout_redirect = "http://sso.example.com/logout"

;#####################
;  Program Settings  #
;#####################

; File Pattern
; This defines which file types Ampache will attempt to catalog
; You can specify any file extension you want in here separating them
; with a |
; DEFAULT: mp3|mpc|m4p|m4a|mp4|aac|ogg|rm|wma|asf|flac|spx|ra|ape|shn|wv
catalog_file_pattern = "mp3|mpc|m4p|m4a|mp4|aac|ogg|rm|wma|asf|flac|spx|ra|ape|shn|wv"

; Video Pattern
; This defines which video file types Ampache will attempt to catalog
; You can specify any file extension you want in here seperating them with
; a | but ampache may not be able to parse them
; DEAFULT: avi|mpg|flv|m4v
catalog_video_pattern = "avi|mpg|flv|m4v"

; Prefix Pattern
; This defines which prefix Ampache will ignore when importing tags from
; your music. You may add any prefix you want seperating them with a |
; DEFAULT: The|An|A|Die|Das|Ein|Eine|Les|Le|La
catalog_prefix_pattern = "The|An|A|Die|Das|Ein|Eine|Les|Le|La"

; Use Access List 
; Toggle this on if you want ampache to pay attention to the access list
; and only allow streaming/downloading/xml-rpc from known hosts xml-rpc 
; will not work without this on.
; NOTE: Default Behavior is DENY FROM ALL 
; DEFAULT: true
access_control	= "true"

; Require Session
; If this is set to true ampache will make sure that the URL passed when
; attempting to retrieve a song contains a valid Session ID This prevents
; others from guessing URL's. This setting is ignored if you have use_auth
; disabled. 
; DEFAULT: true
require_session = "true"

; Require LocalNet Session
; If this is set to true then ampache will require that a valid session
; is passed even on hosts defined in the Local Network ACL. This setting
; has no effect if access_control is not enabled
; DEFAULT: true
require_localnet_session = "true" 

; Multiple Logins
; Added by Vlet 07/25/07
; When this setting is enabled a user may only be logged in from a single
; IP address at any one time, this is to prevent sharing of accounts
; DEFAULT: false
;prevent_multiple_logins = "false"

; Downsample Remote
; If this is set to true and access control is on any users who are not
; coming from a defined 'network' ACL will be automatically downsampled
; regardless of their preferences. Requires access_control to be enabled
; DEFAULT: false
;downsample_remote = "false"

; Track User IPs
; If this is enabled Ampache will log the IP of every completed login
; it will store user,ip,time at one row per login. The results are 
; displayed in Admin --> Users
; DEFAULT: false
;track_user_ip = "false"

; User IP Cardinality
; This defines how many days worth of IP history Ampache will track
; As it is one row per login on high volume sites you will want to 
; clear it every now and then. 
; DEFAULT: 42 days
;user_ip_cardinality = "42"

; Allow Zip Download
; This setting allows/disallows using zlib to zip up an entire
; playlist/album for download. Even if this is turned on you will
; still need to enabled downloading for the specific user you 
; want to be able to use this function
; DEFAULT: false
;allow_zip_download = "false"

; File Zip Download
; This settings tells Ampache to attempt to save the zip file
; to the filesystem instead of creating it in memory, you must
; also set file_zip_path in order for this to work
; DEFAULT: false
;file_zip_download = "false" 

; File Zip Path
; If File Zip Download is enabled this must be set to tell 
; Ampache which directory to save the file to. Do not put a
; trailing slash or this will not work. 
; DEFAULT: false
;file_zip_path = "false" 

; File Zip Comment
; This is an optional configuration option that adds a comment
; to your zip files, this only applies if you've got allow_zip_downloads
; DEFAULT: Ampache - Zip Batch Download
;file_zip_comment = "Ampache - Zip Batch Download" 

; This setting throttles a persons downloading to the specified
; bytes per second. This is not a 100% guaranteed function, and 
; you should really use a server based rate limiter if you want
; to do this correctly. 
; DEFAULT: off
; VALUES: any whole number (in bytes per second)
;throttle_download = 10

; This determines the tag order for all cataloged
; music. If none of the listed tags are found then
; ampache will default to the first tag format
; that was found. 
; POSSIBLE VALUES: ape asf avi id3v1 id3v2 lyrics3 mpeg quicktime riff
;     vorbiscomment
; DEFAULT: id3v2 id3v1 vorbiscomment quicktime ape asf avi mpeg riff
getid3_tag_order = "id3v2,id3v1,vorbiscomment,quicktime,ape,asf,avi,mpeg,riff"

; Determines whether we try to autodetect the encoding for id3v2 tags.
; May break valid tags.
; DEFAULT: false
;getid3_detect_id3v2_encoding = "false"

; This determines the order in which metadata sources are used (and in the
; case of plugins, checked)
; POSSIBLE VALUES (builtins): filename and getID3
; POSSIBLE VALUES (plugins): MusicBrainz, plus any others you've installed.
; DEFAULT: getID3 filename
metadata_order = "getID3,filename"

; Un comment if don't want ampache to follow symlinks
; DEFAULT: false
;no_symlinks	= "false"

; Use auth?
; If this is set to "Yes" ampache will require a valid
; Username and password. If this is set to false then ampache
; will not ask you for a username and password. false is only
; recommended for internal only instances
; DEFAULT true
use_auth	= "true"

; Default Auth Level
; If use_auth is set to false then this option is used
; to determine the permission level of the 'default' users
; default is administrator. This setting only takes affect
; if use_auth if false
; POSSIBLE VALUES: user, admin, manager, guest
; DEFAULT: admin
default_auth_level = "admin"

; 5 Star Ratings
; This allows ratings for almost any object in ampache
; POSSIBLE VALUES: false true
; DEFAULT: true
ratings = "true"

; Sociable
; This turns on / off all of the "social" features of ampache
; default is on, but if you don't care and just want music
; turn this off to disable all social features. 
; DEFAULT: true
sociable = "true"

; This options will turn on/off Demo Mode
; If Demo mode is on you can not play songs or update your catalog
; in other words.. leave this commented out
; DEFAULT: false
;demo_mode = "false"

; Caching
; This turns the caching mechanisms on or off, due to a large number of
; problems with people with very large catalogs and low memory settings
; this is off by default as it does significantly increase the memory
; requirments on larger catalogs. If you have the memory this can create
; a 2-3x speed improvement.
; DEFAULT: false
;memory_cache = false

; Memory Limit
; This defines the "Min" memory limit for PHP if your php.ini
; has a lower value set Ampache will set it up to this. If you
; set it below 16MB getid3() will not work!
; DEFAULT: 32
;memory_limit = 32

; Album Art Preferred Filename
; Specify a filename to look for if you always give the same filename
; i.e. "folder.jpg" Ampache currently only supports jpg/gif and png
; Especially useful if you have a front and a back image in a folder
; comment out if ampache should search for any jpg,gif or png
; DEFAULT: folder.jpg
;album_art_preferred_filename = "folder.jpg" 

; Resize Images * Requires PHP-GD *
; Set this to true if you want Ampache to resize the Album
; art on the fly, this increases load time and CPU usage
; and also requires the PHP-GD library. This is very useful
; If you have high-quality album art and a small upload cap
; DEFAULT: false
;resize_images = "false"

; Art Gather Order
; Simply arrange the following in the order you would like
; ampache to search. If you want to disable one of the search
; methods simply leave it out. DB should be left as the first
; method unless you want it to overwrite what's already in the
; database
; POSSIBLE VALUES: db tags folder amazon lastfm musicbrainz google
; DEFAULT: db,tags,folder,musicbrainz,lastfm,google
art_order = "db,tags,folder,musicbrainz,lastfm,google"

; Amazon Developer Key
; These are needed in order to actually use the amazon album art
; Your public key is your 'Access Key ID'
; Your private key is your 'Secret Access Key'
; DEFAULT: false
;amazon_developer_public_key = ""
;amazon_developer_private_key = ""

; Last.FM API Key
; Set this to your Last.FM api key to actually use Last.FM for
; recommendations.
;lastfm_api_key = ""

; Amazon base urls
; An array of Amazon sites to search.
; NOTE: This will search each of these sites in turn so don't expect it
; to be lightning fast!
; It is strongly recommended that only one of these is selected at any
; one time
; POSSIBLE VALUES: 
;	http://webservices.amazon.com
;	http://webservices.amazon.co.uk
;	http://webservices.amazon.de
;	http://webservices.amazon.co.jp
;	http://webservices.amazon.fr
;	http://webservices.amazon.ca
; Default: http://webservices.amazon.com
amazon_base_urls = "http://webservices.amazon.com"

; max_amazon_results_pages
; The maximum number of results pages to pull from EACH amazon site
; NOTE: The art search pages through the results returned by your search
; up to this number of pages. As with the base_urls above, this is going
; to take more time, the more pages you ask it to process.
; Of course a good search will return only a few matches anyway.
; It is strongly recommended that you do _not_ change this value
; DEFAULT: 1 page (10 items)
max_amazon_results_pages = 1

; Debug
; If this is enabled Ampache will write debugging information to the log file
; DEFAULT: false
;debug = "<%= debug_a %>"

; Debug Level
; This should always be set in conjunction with the
; debug option, it defines how prolific you want the
; debugging in ampache to be. values are 1-5. 
; 1 == Errors only
; 2 == Error + Failures (login attempts etc.)
; 3 == ??
; 4 == ?? (Profit!)
; 5 == Information (cataloging progress etc.)
; DEFAULT: 5
debug_level = 5

; Path to Log File
; This defines where you want ampache to log events to
; this will only happen if debug is turned on. Do not
; include trailing slash. You will need to make sure that
; the specified directory exists and your HTTP server has
; write access.
; DEFAULT: NULL
;log_path = "/var/log/ampache"

; Charset of generated HTML pages
; Default of UTF-8 should work for most people
; DEFAULT: UTF-8
site_charset = UTF-8

; Locale Charset 
; In some cases this has to be different
; in order for XHTML and other things to work
; This is disabled by default, enabled only 
; if needed. It's specifically needed for Russian
; so that is the default
; DEFAULT: cp1251
;lc_charset = cp1251

; Refresh Limit
; This defines the default refresh limit in seconds for 
; pages with dynamic content, such as now playing
; DEFAULT: 60
; Possible Values: Int > 5
refresh_limit = "60"

;#########################################################
; LDAP login info (optional)                             #
;#########################################################

; This setting will silently create an ampache account
; for anyone who can login using ldap (or any other login
; extension). The default is to create new users as guests
; see auto_user config option if you would like to change this
; DEFAULT: false
;auto_create = "false"

; LDAP filter string to use (required)
; For OpenLDAP use "uid" 
; For Microsoft Active Directory (MAD) use "sAMAccountName"
; DEFAULT: null
; ldap_filter = "sAMAccountName"

; LDAP objectclass (required)
; OpanLDAP objectclass = "*"
; MAD objectclass = "organizationalPerson"
; DEFAULT null
;ldap_objectclass = "organizationalPerson"

; Initial credentials to bind with for searching (optional)
; DEFAULT: null
;ldap_username = ""
;ldap_password = ""

; Require that the user is in a specific group (optional)
; DEFAULT: null
;ldap_require_group = "cn=yourgroup,ou=yourorg,dc=yoursubdomain,dc=yourdomain,dc=yourtld"

; This is the search dn used to find users (required)
; DEFAULT: null
;ldap_search_dn = "ou=People,dc=yoursubdomain,dc=yourdomain,dc=yourtld"

; This is the address of your ldap server (required)
; DEFAULT: null
;ldap_url = ""

; Attributes where additional user information is stored (optional)
; OpenLDAP ldap_name_field = "cn"
; MAD ldap_name_field = "displayname"
; DEFAULT: null
;ldap_email_field = "mail"
;ldap_name_field  = "cn"

;#########################################################
; Public Registration settings, defaults to disabled     #
;#########################################################

; This setting turns on/off public registration. It is
; recommended you leave this off, as it will allow anyone to
; sign up for an account on your server.
; REMEMBER: don't forget to set the mail from address further down in the config.
; DEFAULT: false
;allow_public_registration = "false"

; Require Captcha Text on Image confirmation
; Turning this on requires the user to correctly
; type in the letters in the image created by Captcha
; Default is off because its very hard to detect if it failed
; to draw, or they failed to enter it.
; DEFAULT: false
;captcha_public_reg = "false"

; This setting turns on/off admin notification of registration.
; DEFAULT: false
;admin_notify_reg = "false"

; This setting will allow all registrants/ldap/http users 
; to be auto-approved as a user. By default, they will be 
; added as a guest and must be promoted by the admin.
; POSSIBLE VALUES: guest, user, admin
; DEFAULT: guest
;auto_user = "guest"

; This will display the user agreement when registering
; For agreement text, edit templates/user_agreement.php
; User will need to accept the agreement before they can register
; DEFAULT: false
;user_agreement = "false"

;########################################################
; These options control the dynamic down-sampling based #
; on current usage                                      #
; *Note* Down-sampling must be enabled and working      #
;########################################################

; Attempt to optimize bandwidth by dynamically down-sampling
; all connections from users to fit within a maximum bandwidth.   
; The benefit is that it won't downsample more than it needs to.  As it only 
; adjusts the sample rate at the beginning of a song, it may take a few 
; minutes to reset all connections to a lower rate. This won't never go higher
; than a user's sample rate and only applies to users who are set to 
; the Downsample playback method
; DEFAULT: 576
;max_bit_rate = 576

; If min_bit_rate is set then new streams will be denied if it would
; cause all streams to be down-sampled below this rate.
; DEFAULT: 48
;min_bit_rate = 48

;######################################################
; These are commands used to transcode non-streaming
; formats to the target file type for streaming. 
; This can be useful in re-encoding file types that don't stream
; very well, or if your player doesn't support some file types. 
; This is also the string used when 'downsampling' is selected
; as some people have complained its not bloody obvious, any programs
; referenced in the downsample commands must be installed manually and in
; the web server path, and executable by the web server
; REQUIRED variables
; transcode_TYPE	= true/false ## True to force transcode regardless of prefs
; transcode_TYPE_target	= TARGET_FILE_TYPE
; transcode_cmd_TYPE	= TRANSCODE_COMMAND
; %FILE%	= filename
; %OFFSET%	= offset
; %SAMPLE%	= sample rate
; %EOF%		= end of file in min.sec

; List of filetypes to transcode
transcode_m4a 		= true
transcode_m4a_target 	= mp3 
;transcode_flac 	= true
transcode_flac_target	= mp3
;transcode_mp3  	= false
transcode_mp3_target	= mp3
;transcode_ogg 		= false
transcode_ogg_target	= mp3

; These are the commands that will be run to transcode the file
transcode_cmd_flac 	= "flac -dc %FILE% | lame -b %SAMPLE% -S - - "
transcode_cmd_m4a 	= "faad -f 2 -w %FILE% | lame -r -b %SAMPLE% -S - -"
transcode_cmd_mp3	= "mp3splt -qnf %FILE% %OFFSET% %EOF% -o - | lame --mp3input -q 3 -b %SAMPLE% -S - -"
transcode_cmd_ogg   	= "oggsplt -qn %FILE% %OFFSET% %EOF% -o - | oggdec -Q -o - - | lame -S -q 3 -b %SAMPLE% -S - -"

; Alternative command works better for some people
;transcode_cmd_m4a       =  "alac %FILE% | lame -h -b %SAMPLE% -S - -"
;transcode_cmd_ogg   	= "mp3splt -qn %FILE% %OFFSET% %EOF% -o - | oggdec -Q -o - - | lame -S -q 3 -b %SAMPLE% -S - -"
;transcode_cmd_flac	= "flac -dc %FILE% | lame -rb %SAMPLE% -S - -"

; This line seems to work better for windows, switch if needed
;transcode_cmd_mp3	= "lame -q 3 -b %SAMPLE% -S %FILE% - -" 

;######################################################
; these options allow you to configure your rss-feed
; layout. rss exists of two parts, main and song main is the information about the feed
; song is the information in the feed. can be multiple items.
; use_rss = false (values true | false)
;DEFAULT: use_rss = true
use_rss = true
;#####################################################

;#############################
;  Proxy Settings (optional) #
;#############################
; If Ampache is behind an http proxy, specifiy the hostname or IP address
; port, proxyusername, and proxypassword here.
;DEFAULT: not in use
;proxy_host = "192.168.0.1"
;proxy_port = "8080"
;proxy_user = ""
;proxy_pass = ""

; If Ampache is behind an https reverse proxy, force use HTTPS protocol.
;Default: false
;force_ssl = true

;#############################
;   Mail Settings            #
;#############################

;Method used to send mail
;POSSIBLE VALUES: smtp sendmail php
;DEFAULT: php
;mail_type = "php"

;Mail domain.
;DEFAULT: example.com 
;mail_domain = "example.com"

;This will be combined with mail_domain and used as the source address for
;emails generated by Ampache.  For example, setting this to 'me' will set the
;sender to 'me@example.com'.
;DEFAULT: info
;mail_user = "info"

;A name to go with the email address.
;DEFAULT: Ampache
;mail_name = "Ampache"

;How strictly email addresses should be checked.
;easy does a regex match, strict actually performs some SMTP transactions
;to see if we can send to this address.
;POSSIBLE VALUES: strict easy none
; DEFAULT: strict
;mail_check = "strict"


;############################
;   sendmail Settings       #
;############################

;DEFAULT: /usr/sbin/sendmail
;sendmail_path = "/usr/sbin/sendmail"

;#############################
;   SMTP Settings            #
;#############################

;Mail server (hostname or IP address)
;DEFAULT: localhost
;mail_host = "localhost"

; SMTP port
;DEFAULT: 25
;mail_port = 25

;Secure SMTP
;POSSIBLE VALUES: ssl tls
;DEFAULT: none
;mail_secure_smtp = tls

;Enable SMTP authentication
;DEFAULT: false
;mail_auth = true

;SMTP Username
;your mail auth username.
;mail_auth_user = ""

; SMTP Password
; your mail auth password.
;mail_auth_pass = ""

;#############################
;   Multibyte Settings       #
;#############################
; Use Iconv or not
; DEFAULT: false
;use_iconv = false

; mb_detect_order
; comma separated, available encodings are listed on php.net.
; see http://php.net/manual/mbstring.supported-encodings.php
; DEFAULT: auto
;mb_detect_order = "EUC-JP, SJIS, eucJP-win, SJIS-win, JIS, ISO-2022-JP, ASCII, UTF-8, UTF-7"

