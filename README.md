# subrain

crappy bash script that automates subdomain enumeration. relies heavily on tools written by wiser hackers.


## dependencies

* sublist3r
* assetfinder
* httprobe
* anew
* probably loads more by the time this thing is done.


## usage

```
./subrain.sh <input_file>
```

where ""input_file" is a list of subomains you want to enumerate, seperated by newline. the following format works best.
```
* domain.com
* foo.domain.com
* bar.domain.com
```


