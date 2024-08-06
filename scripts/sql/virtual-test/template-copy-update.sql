update virtualtestcustomscore set districtid = 6787, name = REPLACE(Name, 'Copy_', '')
where districtid = 6106
and name like 'Copy_%'
