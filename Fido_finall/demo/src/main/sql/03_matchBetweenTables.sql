drop table if exists public.matchBetweenTables cascade;

create table public.matchBetweenTables (
  id bigint generated always as identity primary key,
  student_id bigint not null references public.students(id) on delete cascade,
  subject_id bigint not null references public.subject(id) on delete cascade,
  group_number int not null
);

insert into public.matchBetweenTables (student_id, subject_id, group_number)
select s.id, sub.id, 5
from public.students s, public.subject sub
where s.name_student = 'cat' and sub.name_subject = 'Програмування';

insert into public.matchBetweenTables (student_id, subject_id, group_number)
select s.id, sub.id, 5
from public.students s, public.subject sub
where s.name_student = 'dog' and sub.name_subject = 'Програмування';

insert into public.matchBetweenTables (student_id, subject_id, group_number)
select s.id, sub.id, 3
from public.students s, public.subject sub
where s.name_student = 'rat' and sub.name_subject = 'Прикладна прокрастинація';

alter table public.matchBetweenTables enable row level security;
drop policy if exists "public read match" on public.matchBetweenTables;
create policy "public read match"
  on public.matchBetweenTables for select to anon using (true);
