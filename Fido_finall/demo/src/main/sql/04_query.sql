select s.name_student as "ПІБ", s.email
from public.students s
join public.matchBetweenTables m on m.student_id = s.id
join public.subject sub on sub.id = m.subject_id
where sub.name_subject = 'Програмування'
  and m.group_number = 5;
