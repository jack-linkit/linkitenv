sed -n "s/.*TeacherCode (\(.*\)) associated with a different TeacherName (\(.*\)) than provided (\(.*\))/('\1','\3')/p" | sort | uniq
