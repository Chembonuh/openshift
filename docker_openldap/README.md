# LDAP Management Ansible Role

This Ansible role is designed to manage LDAP (Lightweight Directory Access Protocol) services using Docker containers. It sets up an OpenLDAP server, deploys phpLDAPadmin for LDAP management, and configures LDAP clients for authentication. This role also includes the management of Docker volumes and network configurations.

## Features

- **OpenLDAP Container Management**: Deploy and manage OpenLDAP Docker containers.
- **phpLDAPadmin Container Management**: Deploy and manage phpLDAPadmin Docker containers for LDAP administration.
- **LDAP Configuration**: Configure LDAP entries, manage LDAP network settings, and handle LDAP data and certificate storage.
- **Client Configuration**: Configure LDAP clients for different Linux distributions (Debian/Ubuntu, RedHat).
- **Certificate Management**: Handle certificate generation and configuration for LDAP services.

## Requirements

- Docker must be installed on the target host.
- Ansible 2.9 or higher.
- Python3 and relevant Python libraries must be installed on the control node.

## Role Variables
| Variable                       | Example/Default        | Description                                                                                                     |
|--------------------------------|------------------------|-----------------------------------------------------------------------------------------------------------------|
| `docker_ldap_container`        | Dictionary             | Configuration for the OpenLDAP Docker container.                                                                |
| `ldap_certs_volume_params`      | Parameters             | Parameters for the Docker volume used to store LDAP certificates.                                               |
| `ldap_data_volume_params`       | Parameters             | Parameters for the Docker volume used to store LDAP data.                                                        |
| `ldap_url`                      | URL                    | URL for the LDAP server.                                                                                        |
| `docker_php_container`          | Dictionary             | Configuration for the phpLDAPadmin Docker container.                                                             |
| `ldap_phpconfig_volume_params`  | Parameters             | Parameters for the Docker volume used to store phpLDAPadmin configuration.                                      |
| `openldap_ports`                | Ports                  | Ports for OpenLDAP.                                                                                             |
| `phpldapadmin_ports`            | Ports                  | Ports for phpLDAPadmin.                                                                                         |
| `ldap_state`                    | State (e.g., `started`) | State of the LDAP service.                                                                                     |
| `ansble_host_port_ports`        | Ports                  | Ports for the Ansible host.                                                                                    |
| `ansible_host`                  | IP or Hostname         | IP address or hostname of the Ansible host.                                                                    |
| `bind_dn`                       | DN                     | DN for LDAP binding (e.g., `cn=admin,dc=lab,dc=orc`).                                                           |
| `volume_mount_defaults`         | Defaults               | Default parameters for volume mounts.                                                                          |
| `docker_volume_defaults`        | Defaults               | Default parameters for Docker volumes.                                                                         |
| `ldap_certs_volume_params`      | Parameters             | Parameters for the LDAP certificates Docker volume.                                                             |
| `ldap_data_volume_params`       | Parameters             | Parameters for the LDAP data Docker volume.                                                                    |
| `ldap_phpconfig_volume_params`  | Parameters             | Parameters for the phpLDAPadmin configuration Docker volume.                                                    |


### OpenLDAP Configuration

- `docker_ldap_container`: Dictionary containing the configuration for the OpenLDAP Docker container.
- `ldap_certs_volume_params`: Parameters for the Docker volume used to store LDAP certificates.
- `ldap_data_volume_params`: Parameters for the Docker volume used to store LDAP data.

### phpLDAPadmin Configuration

- `docker_php_container`: Dictionary containing the configuration for the phpLDAPadmin Docker container.
- `ldap_phpconfig_volume_params`: Parameters for the Docker volume used to store phpLDAPadmin configuration.

### Network Configuration

- `openldap_ports`: Ports for OpenLDAP.
- `phpldapadmin_ports`: Ports for phpLDAPadmin.

### General Configuration

- `ldap_state`: State of the LDAP service (e.g., `started`, `stopped`).

## Role Structure
--------------
```plaintext
roles/docker_openldap/
├── defaults
│   └── main.yml
├── files
│   └── certs
│       ├── ca.crt
│       ├── load_memberof.ldif
│       └── networkServices.ldif
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── README.md
├── tasks
│   ├── add_entries.yaml
│   ├── main.yml
│   ├── openldap_client_debian.yaml
│   ├── openldap_client_redhat.yaml
│   └── provision_openldap.yaml
├── templates
│   ├── common-auth.j2
│   ├── config.php.j2
│   ├── ldap.conf.j2
│   ├── nslcd.conf.j2
│   └── nsswitch.conf.j2
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml


## Dependencies
None.
roles/docker_procision

## Example Playbook
- name: Deploy Docker-base ldap Container
  hosts: docker_openldap
  become: true
  roles:
    - role: docker_openldap
  vars:
    add_entry: true
    configure_client: false
    generate_server_certs: false
    openldap_provision: false
  tags: [docker_openldap, never]

```

## Usage

1. **LDAP and phpLDAPadmin Containers**: This role will deploy OpenLDAP and phpLDAPadmin containers, ensuring that they are properly networked and configured.
2. **Volume Management**: Docker volumes for LDAP data, certificates, and phpLDAPadmin configuration are managed automatically.
3. **LDAP Client Configuration**: Clients are configured based on the host's OS family (Debian or RedHat), ensuring proper authentication through LDAP.
4. **Certificate Management**: Certificates for LDAP services are handled, ensuring secure communication.

## Important Notes

- Ensure that the variables are correctly set according to your environment.
- Verify that the Docker service is running on the target host before executing this role.
- Regularly update the Docker images and monitor for any security advisories related to OpenLDAP or phpLDAPadmin.

Licen
