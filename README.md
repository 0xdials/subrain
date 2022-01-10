# subrain

bash script that automates subdomain enumeration. this was quickly thrown together as a skeleton for a future project. it also relies heavily on tools written by other, smarter hackers.


## dependencies

* assetfinder
* httprobe
* anew (using anewer on arch)


## usage

```
./subrain.sh <input_file>
```

where "input_file" is a list of subomains you want to enumerate, separated by newline. the following format works best.
```
domain.com
foo.domain.com
bar.domain.com
```

## todo list

* add masscan
* add sublist3r 
* add screenshot capabilities
* add various flags including verbose
* rewrite in different language, removing several dependencies

