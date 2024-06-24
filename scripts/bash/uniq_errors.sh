grep 'Error: ' | sed -n 's/.*\(Error:.*\)/\1/p' | sort | uniq
