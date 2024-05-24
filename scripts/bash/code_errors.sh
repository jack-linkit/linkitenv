sed -n "s/.*TeacherName (\(.*\)) associated with a different TeacherCode (\(.*\)) than provided (\(.*\))/('\1','\3')/p" | sort | uniq
