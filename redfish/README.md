Redfish Management Role README
==============================
Overview
--------

This Ansible role provides a comprehensive solution for managing computer systems using the Redfish standard. It includes tasks for controlling power state, updating firmware, and setting boot options on systems that support the Redfish API.

Redfish is a standard for data center and systems management that delivers simple and secure management for converged, hybrid IT and the Software Defined Data Center (SDDC).
Features

**Power Control**: Power on, force off, and reboot systems.

**Firmware Updates**: Update BIOS and BMC (Baseboard Management Controller) firmware versions.

**Boot Management**: Set PXE (Preboot Execution Environment) boot override for network-based boot operations.

Requirements
------------

- Ansible 2.9 or higher.
- Redfish API Support: Systems to be managed must be equipped with and support the Redfish API.
- Baseboard Management Controller (BMC): Systems must contain a BMC for out-of-band management.
- Network Connectivity: There should be network connectivity between the Ansible control node and the managed systems.

Role Structure
--------------

```plaintext
roles/redfish/
├── defaults
│   └── main.yaml
├── meta
│   └── main.yaml
├── README.md
└── tasks
    ├── main.yaml
    ├── power-on-computer.yaml
    ├── pxe-boot.yaml
    ├── update-bios.yaml
    └── update-bmc.yaml
```

Role Variables
---------------

  | Variable             | Example/Default           | Description                                            |
  |----------------------|---------------------------|--------------------------------------------------------|
  | `ansible_host`       | `192.168.1.100`           | IP address or hostname of the target system.           |
  | `ansible_user`       | `admin`                   | Username for Redfish service authentication.           |
  | `ansible_password`   | `password`                | Password for Redfish service authentication.           |
  | `bios_version`       | `v1.0.4`                  | Desired BIOS firmware version for updates.             |
  | `bmc_version`        | `v2.0.3`                  | Desired BMC firmware version for updates.              |
  | `nginx_server_url`   | `http://myserver.com`     | URL of the server where firmware images are hosted.    |
  | `bios_path`          | `/RBU.image`              | Path to the BIOS firmware image.                       |
  | `bmc_path`           | `/rom.ima_enc`            | Path to the BMC firmware image.                        |
  | `update_bios`        | `false`                   | Set to `true` to enable BIOS firmware update tasks.    |
  | `update_bmc`         | `false`                   | Set to `true` to enable BMC firmware update tasks.     |
  | `pxe_boot`           | `false`                   | Set to `true` to enable setting PXE boot override.     |
  | `power_on`           | `false`                   | Set to `true` to enable powering on the system.        |
  | `power_off`          | `false`                   | Set to `true` to enable forcing the system power off.  |
  | `system_reboot`      | `false`                   | Set to `true` to enable system reboot.                 |
  | `nginx_server_host`  | `"{{ hostvars['host_name']['ansible_host'] }}"` | The IP address or hostname for the NGINX server hosting the firmware images. This variable dynamically retrieves the address from the host `host_name` in your Ansible inventory using `hostvars`. This is particularly useful if the NGINX server's address can change or if you manage multiple environments where this address differs. |

Tasks Description
-----------------

**Get Session Token**: Establish a session with the Redfish service.

**Power Control**: Options to power on, force off, or reboot the system.

**Set PXE Boot Override**: Configure the system to boot from the network.

**Update Firmware**: Check current firmware versions, decide if an update is needed, perform the update, and verify it.

**Destroy Session Token**: Cleanly close the session with the Redfish service.

Usage
-----

Set up the necessary variables in the playbook or within defaults/main.yaml.

Include this role in the Ansible playbook.

```yaml
  - name: Update System Firmware
    hosts: host_bmc
    connection: local
    become: true
    roles:
      - role: redfish
    vars:
      update_bios: true
      update_bmc: true
    tags: [desired_tag, never]
```

Dependencies
------------

  Before running this Ansible role for firmware updates, certain preparatory steps are required:

1. **Download Firmware Packages**: Obtain the latest firmware update packages (zip files) from the Gigabyte website for the BIOS and BMC.

2. **Extract Firmware Images**: Unzip these packages to extract the firmware images. These images are typically in `.bin`, `.ima`, or similar formats.

3. **Host Firmware Images on a Local HTTP Server**:
  - The extracted firmware images must be hosted on a local HTTP server (like NGINX or Apache).
  - Ensure that this server is accessible from the target systems where the firmware update will occur.
  - The paths (`bios_path` and `bmc_path`) in the role variables refer to the location of these images on the HTTP server. For example, if your NGINX server hosts a BIOS image at `http://myserver.com/images/bios_image.bin`, the `bios_path` should be set to `/images/bios_image.bin`.

>>>
**Important Notes**:
  - This step is crucial as the role does not handle the downloading and extraction of firmware images. It assumes that these images are already available and accessible on your specified HTTP server.
  - The role’s tasks that update the firmware will pull the firmware images from this HTTP server, so the server's reliability and accessibility are critical for the update process.
>>>

License
-------

BSD

Author Information
------------------

GVSC
