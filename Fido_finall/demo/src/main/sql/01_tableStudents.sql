create table if not exists public.students (
  id bigint generated always as identity primary key,
  name_student VARCHAR(50) not null, 
  date_of_birth date not null,
  email text not null,
  telefone integer not null,
  year_of_university_entry integer not null
);

delete from public.students;
insert into public.students (name_student, date_of_birth, email, telefone, year_of_university_entry) 
values ('cat', '2020-02-17', 'cat@gmail.com', '911', '2016');
insert into public.students (name_student, date_of_birth, email, telefone, year_of_university_entry) 
values ('dog', '1991-08-24', 'dog@gmail.com', '811', '2017');
insert into public.students (name_student, date_of_birth, email, telefone, year_of_university_entry) 
values ('rat', '1988-01-01', 'rat@gmail.com', '711', '2018');

alter table public.students enable row level security;

drop policy if exists "public read messages" on public.students;
create policy "public read messages"
  on public.students for select to anon using (true);