# ansible-nginx

[nginx](http://nginx.org/) is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP proxy server

[![Platforms](http://img.shields.io/badge/platforms-ubuntu-lightgrey.svg?style=flat)](#)
[![Build Status](https://travis-ci.org/telusdigital/ansible-php.svg?branch=master)](https://travis-ci.org/telusdigital/ansible-php)

Tunables
--------
* `nginx_port` (integer) - The default unsecure port nginx will listen on
* `nginx_user` (string) - User to run nginx as
* `nginx_worker_processes` (integer) - number of worker processes
* `nginx_worker_connections` (integer) - maximum connections per worker
* `nginx_runtime_root` (string) - Directory for runtime data
* `nginx_pidfile_path` (string) - Path for pidfile
* `nginx_socket_path` (string) - Path for socket
* `nginx_log_root` (string) - Directory for logs
* `nginx_access_log_enabled` (boolean) - Enable access logs?
* `nginx_access_log_path` (string) - Path for access log
* `nginx_access_log_ignore_static_assets` (boolean) - Do not log requests for static assets
* `nginx_access_log_format` (string) - Log format to use
* `nginx_error_log_enabled` (boolean) - Enable error logs?
* `nginx_error_log_path` (string) - Path for error log
* `nginx_error_log_critical_only` (boolean) - Only log critical errors?
* `nginx_hide_version` (boolean) - Hide version of nginx?
* `nginx_naxsi_enabled` (boolean) - Enable naxsi WAF
* `nginx_attack_mitigation_enabled` (boolean) - Aggressively favour resiliency over compatibility?
* `nginx_gzip_enabled` (boolean) - Compress responses?
* `nginx_performance_tuning_enabled` (boolean) - Aggressively favour performance over compatibility?
* `nginx_file_descriptor_caching_enabled` (boolean) - Enable file descriptor caching?
* `nginx_docroot` (string) - Directory for docroot
* `nginx_creates_docroot` (boolean) - Enable to get nginx to create the docroot path
* `nginx_standard_configuration` (boolean) - Using included configuration?
* `nginx_passenger_enabled` (boolean) - Enable passenger for Ruby apps?
* `nginx_php_enabled` (boolean) - Pass requests for PHP files to php-fpm?
* `php_fpm_socket_path` (string) - Path to socket for php-fpm
* `nginx_ssl_port` (integer) - The default secure port nginx will listen on
* `nginx_ssl_disabled` (boolean) - Redirect HTTPS to HTTP
* `nginx_ssl_enforced` (boolean) - Redirect HTTP to HTTPS
* `nginx_ssl_enabled` (boolean) - Enable HTTPS support
* `nginx_ssl_certificate_path` (string) - Path to SSL public key (certificate file)
* `nginx_ssl_key_path` (string) - Path to SSL private key (key file)
* `nginx_ssl_should_degrade_security_to_accomodate_old_browsers` (boolean) - Compromise security to support older browsers?
* `nginx_ssl_protocol_detection` (boolean) - Write a cookie with the clients TLS version in it
* `nginx_cors_enabled` (boolean) - Enable CORS support?
* `nginx_cors_whitelist_enabled` (boolean) - Use whitelisting for CORS handling?
* `nginx_cors_whitelist_protocol` (string) - Protocol to require for CORS?
* `nginx_cors_whitelist_hosts` (string) - Regular expression to match hosts against for CORS whitelist.
* `nginx_redirect_missing_files_to_root` (boolean) - Redirect HTTP 404s to / (this is usually a bad idea)
* `nginx_client_max_body_size` (string) - Maximum size of the body of a request.
* `nginx_file_extension_blacklist` (string) - Refuse to serve files matching this regular expression.
* `nginx_auth_enabled` (boolean) - Enable HTTP Basic Auth?
* `nginx_auth_password` (string) - Password for HTTP Basic Auth.
* `nginx_auth_location` (string) - Path to auth file?
* `nginx_auth_username` (string) - Username for auth?
* `nginx_auth_salt` (string) - Salt for auth password?
* `nginx_fastcgi_buffers` (string) - Buffer size for FastCGI requests
* `nginx_context_proxy_enabled` (boolean) - Proxy requests for specific context paths?
* `nginx_context_proxy_pass_location_try_files_override` (boolean) - Disable default location try_files if proxy context_path conflicts?
* `nginx_context_proxy_host` (string) - Upstream location for proxied requests
* `nginx_context_proxy_domain_equivalence` (string) - Rewrite cookies for one domain to another, with proxied requests.
* `nginx_context_proxy_paths` (list) - Paths that should be proxied
* `nginx_domain_redirect` (boolean) - This... probably does something. What is a mystery.
* `nginx_redirects` (list) - List of things to redirect to other things.
* `nginx_redirects_for_browser_profile_and_locale_enabled` (boolean) - Very... specific redirect rules. You probably don't have any use for this.
* `nginx_php_virtual_context_path` (string) - If an application is served
* `nginx_php_path_blacklist_enabled` (boolean) - Blacklist paths from being sent to php-fpm.
* `nginx_php_path_blacklist_regexp` (string) - Do not hand off requests matching this regular expression to php-fpm
* `nginx_php_path_blacklist_try_files` (string) - try_files directive for blacklisted files.
* `nginx_php_append_querystring` (string) - Append this to PHP querystrings.
* `nginx_php_html_index` (string) - Allow HTML index files if PHP is enabled?
* `nginx_php_fix_321` (boolean) - Enable the fix indicated in https://trac.nginx.org/nginx/ticket/321
* `nginx_developer_environments_enabled` (boolean) - Map subdomains to project directories for users.
* `nginx_developer_environment_regexp` (string) - Regular expression to match developer environments
* `nginx_developer_environment_docroot` (string) - Docroot for developer environments
* `nginx_php_fastcgi_param_extras` (list) - Extra parameters to send to php-fpm
* `nginx_php_index_only` (boolean) - Only accept requests for index.php
* `nginx_static_asset_handling_enabled` (boolean) - Enable optimizations for static asset handling?
* `nginx_static_asset_handling_extentions` (list) - Extentions to handle as static assets
* `nginx_internal_paths_enabled` (boolean) - Treat some paths as internal?
* `nginx_internal_paths` (boolean) - List of paths to treat as internal
* `nginx_whitelist_ips` (list) - List of IPs to allow access to whitelisted paths.
* `nginx_whitelist_paths` (list) - List of whitelisted paths.
* `nginx_index` (string) - Index filename(s)
* `nginx_localhost_authorization_required` (boolean) - Require authorization if requests are from localhost?
* `nginx_flag_social_crawlers` (boolean) - Flag social crawlers?
* `nginx_prerender_enabled` (boolean) - Enable prerender.io support
* `nginx_configuration_name` (string) - Name of the configuration file to use the standard configuration template
* `nginx_configuration_type` (string) - Filename of the configuration file
* `nginx_insecure_listener_enabled` (boolean) - Enable the insecure (http, non-ssl) listener
* `nginx_http2_enabled` (boolean) - Enable http2 on the ssl connections
* `nginx_pre_extended_configuration` (string) - complex project specific configuration (to be included just after https handshake standardl-configuration)
* `nginx_post_extended_configuration` (string) - complex project specific configuration (to be appended to the end of the the standard-configuration)
* `nginx_restricted_paths` (list) - List of paths to restrict access to.
* `nginx_allow_access_to_restricted_paths_from_ips` (list) - List of ip addresses that require access to 'nginx_restricted_paths'.
* `nginx_restricted_paths_for_security` (list) - List of paths to be blocked for security reasons (ideally playbooks dont override this)
* `nginx_whitelist_ips_for_security` (list) - Whitelisted CIDR list to bypass security
* `nginx_harden_for_wordpress` (boolean) - Harden configuration for wordpress to make it more secure
* `nginx_pagespeed_enabled` (boolean) - Is google page speed enabled?
* `nginx_pagespeed_modules` (list) - List of pagespeed modules to enable

Dependencies
------------
* [telusdigital.apt-repository](https://github.com/telusdigital/ansible-apt-repository/)

Example Playbook
----------------
    - hosts: servers
      roles:
         - role: telusdigital.nginx

License
-------
[MIT](https://tldrlegal.com/license/mit-license)

Contributors
------------
* [Chris Olstrom](https://colstrom.github.io/) | [e-mail](mailto:chris@olstrom.com) | [Twitter](https://twitter.com/ChrisOlstrom)
* Steven Harradine
* Aaron Pederson
* Justin Scott
* Prashant Kandathil
* Ben Visser
* Rob Felix
