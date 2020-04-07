# backup-ldap
Docker container for ldap backup

# usage

## docker

```
# run every hour ldap backup
docker run -d -e SCHEDULE="* */1 * * *" -e LDAPPASSWORD=mysecretpassword -e LDAPUSER=cn=admin,dc=domain,dc=com -e LDAPBASE=dc=domain,dc=com --name test plenus/backup-ldap:1.0.1
```

dump is created in file /dump/ldap.ldif
