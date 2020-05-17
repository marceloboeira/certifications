# IAM 101
> Identity Access Management

### What is IAM?

IAM allows you to manage users, groups, permissions, roles and their assignments.

It features:
* Centralised control
* Shared Access
* Granular Permissions
* Identity Federation (i.e.: Active Directory, OneLogin...)
* MFA - Multi-factor Authentication
* Temporary access (when necessary)

### Concepts

* Organization - Your company root account or sub-accounts.
* User - Employees/people in the org.
* Group - Collection of users, each users inherits permissions from the group.
* Policies - Declarative Permission Documents based on JSON, i.e.: allow a group to perform writes to S3.
* Role - An abstract user that can be assumed by other users or resources, i.e.: "user-a assumes root role to be able to run task x"

### Practice

* Setup account
* Create Group for Admins (with permission)
* Add User to Group
* Setup password permissions
* Create a Role with S3 permissions

### Take-aways

* When you create a user is universal (not bound by region at this time).
* The root account is authenticated by email and has access to all resources/policies
* New Users have NO permissions
* New Users can be assigned to Access Key ID & Secret for API level access
* New Users can be allowed to console access

## Types of User

* Root User - All access
* New User - No access at all
* PowerUser - All access except IAM administration (creating new users)
