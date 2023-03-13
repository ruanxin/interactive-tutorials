Login to your BTP account:

```
btp login
```{{exec}}

After successful login you should be able to see your subaccounts:
```
btp --format json list accounts/subaccount | jq
```{{exec}}

Assign `guid` of the subaccount you want to use to the `SUBACCOUNT` environment variable. If your subaccount name is `trial` you can use this snippet:
```
SUBACCOUNT=$(btp --format json list accounts/subaccount | jq -r '.value[] | select(.displayName == "trial") | .guid')
```{{exec}}

Otherwise, set it manually:
```
SUBACCOUNT=_your_subacount_guid_
```

Create Service Manager instance (you need it to get credentials you can use in your cluster without being logged in with our user):
```
btp create services/instance --subaccount $SUBACCOUNT --service myservicemanager --plan-name service-operator-access --offering-name service-manager
```{{exec}}

And the binding (binding contains actual credentials):
```
btp create services/binding --subaccount $SUBACCOUNT --name smbinding --instance-name myservicemanager
```{{exec}}

Check if binding has ready property set to true:
```
btp --format json  get services/binding --name smbinding --subaccount $SUBACCOUNT | jq
```{{exec}}
