Role Name
=========

Install php 5.6.x from webtatic together with mod_php for httpd 2.4 

Requirements
------------

None.

Role Variables
--------------

---
# defaults file for php5

```
php_packages: [ php56w, php56w-cli, ... ]
php_ini_variables:
  - { option: "max_execution_time" , value: "60" , section: "PHP" }
  - { option: "memory_limit" , value: "1024M" , section: "PHP" }
```

Dependencies
------------

Requires ``cristiroma.httpd``

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```

  ---
  - hosts: all
    user: root
    vars:
      root_email_alias: "sys@eaudeweb.ro"
      server_hostname: "test"
  
    roles:
      - { role: "cristiroma.production" }
      - { role: "cristiroma.httpd" }
```

License
-------

BSD

Author Information
------------------

@cristiroma
