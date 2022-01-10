# subrain

crappy bash script that automates subdomain enumeration. this was quickly thrown together as a skeleton for a future project. it also relies heavily on tools written by other, smarter hackers.


## dependencies

* sublist3r
* assetfinder
* httprobe
* anew (using anewer on arch)
* probably loads more by the time this thing is done.


## usage

```
./subrain.sh <input_file>
```

where ""input_file" is a list of subomains you want to enumerate, separated by newline. the following format works best.
```
domain.com
foo.domain.com
bar.domain.com
```

## todo list

* add sublist3r support
* add httprobe support
* add screenshot capabilities
* add various flags including verbose
* rewrite in different language, removing several dependencies

