grep 'Warning: ' | sed -n 's/.*\(Warning:.*\)/\1/p' | sort | uniq
