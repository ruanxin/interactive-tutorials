Login to your BTP account:
```
btp login --sso manual
```{{exec}}

Copy the login URL, paste it in another browser window/tab and log in to your BTP account.

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